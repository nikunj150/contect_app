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
  ContactProvider? providerW;
  ContactProvider? providerR;
  @override

  Widget build(BuildContext context) {

    providerR =context.read<ContactProvider>();
    providerW =context.watch<ContactProvider>();
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
          title: Text("Contact List"),/* providerW!.contactList.length*/
        ),
        body: ListView.builder(itemCount:1,itemBuilder: (context, index) {

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height*0.12,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.grey.shade300),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.grey,
                    ),
                    SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Name"),
                        SizedBox(height: 9),
                        Text("number"),
                      ],
                    ),
                    Spacer( ),
                    IconButton(onPressed: () {

                    }, icon: Icon(Icons.delete_outline,color: Colors.red,))
                  ],
                ),
              ),
            ),
          );

        },),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
          Navigator.pushNamed(context,'detailAdd');
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
