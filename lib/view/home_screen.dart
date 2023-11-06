import 'dart:io';

import 'package:contect_app/provider/contact_provider.dart';
import 'package:contect_app/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ContactProvider? providerw;
  ContactProvider? providerr;

  @override
  Widget build(BuildContext context) {
    providerr = context.read<ContactProvider>();
    providerw = context.watch<ContactProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Consumer<ThemeProvider>(
              builder: (context, value1, child) => Switch(
                value: value1.isLight,
                onChanged: (value) {
                  value1.changeTheme();
                },
              ),
            ),
          ],
          title: Text("Contact List"),
        ),
        body: ListView.builder(
          itemCount: providerw!.contactList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context,'info',arguments: providerr!.contactList[index]);
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.12,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black12),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        /*Text("${providerr!.contactList[index].name!.substring(0, 1)}")*/
                        (providerw!.contactList[index].image == null)
                    ? CircleAvatar(
                    radius: 35,
                    child: Text("${providerw!.contactList[index].name?.substring(0, 1).toUpperCase()}",style: TextStyle(fontSize: 25),),
                  )
                            : CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.grey,
                      backgroundImage: FileImage(File(
                          "${providerw!.contactList[index].image}"))),
                        SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${providerr!.contactList[index].name}"),
                            SizedBox(height: 9),
                            Text("${providerr!.contactList[index].phone}"),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.call,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'detailAdd');
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
