import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/contact_provider.dart';

class PrivateScreen extends StatefulWidget {
  const PrivateScreen({super.key});

  @override
  State<PrivateScreen> createState() => _PrivateScreenState();
}

class _PrivateScreenState extends State<PrivateScreen> {
  @override
  ContactProvider? providerr;
  ContactProvider? providerw;

  Widget build(BuildContext context) {
    providerr = context.read<ContactProvider>();
    providerw = context.watch<ContactProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Private Contact"),
        ),
        body: ListView.builder(
          itemCount: providerw!.privateContactList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  providerr!.storeIndex(index);
                  Navigator.pushNamed(context, 'info',
                      arguments: providerr!.privateContactList[index]);
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
                        (providerw!.privateContactList[index].image == null)
                            ? CircleAvatar(
                                radius: 35,
                                child: Text(
                                  "${providerw!.privateContactList[index].name?.substring(0, 1).toUpperCase()}",
                                  style: TextStyle(fontSize: 25),
                                ),
                              )
                            : CircleAvatar(
                                radius: 35,
                                backgroundColor: Colors.grey,
                                backgroundImage: FileImage(File(
                                    "${providerw!.privateContactList[index].image}"))),
                        SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${providerr!.privateContactList[index].name}"),
                            SizedBox(height: 9),
                            Text("${providerr!.privateContactList[index].phone}"),
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
      ),
    );
  }
}
