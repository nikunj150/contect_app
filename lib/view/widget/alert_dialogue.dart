import 'package:contect_app/model/model_class.dart';
import 'package:contect_app/provider/contact_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void showWidget(BuildContext context, Contactmodel c1) {
  showDialog(
    context: context,
    builder: (context) {
      TextEditingController txtName = TextEditingController(text: c1.name);
      TextEditingController txtEmail = TextEditingController(text: c1.email);
      TextEditingController txtNo = TextEditingController(text: c1.phone);
      return AlertDialog(
        title: Text("Update Contact"),
        actions: [
          TextField(
            controller: txtName,
            decoration: InputDecoration(
              label: Text("Name"),
            ),
          ),
          TextField(
            controller: txtNo,
            decoration: InputDecoration(
              label: Text("Contact"),
            ),
          ),
          TextField(
            controller: txtEmail,
            decoration: InputDecoration(
              label: Text("Email"),
            ),
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(onPressed: () {
              Contactmodel c1 = Contactmodel();
              c1.name=txtName.text;
              c1.phone=txtNo.text;
              c1.email=txtEmail.text;
              context.read<ContactProvider>().updateData(c1);
              Navigator.pop(context);
              Navigator.pop(context);
            }, child: Text("Update")),
          )
        ],
      );
    },
  );
}
