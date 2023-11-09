import 'dart:io';

import 'package:contect_app/model/model_class.dart';
import 'package:contect_app/provider/contact_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

void showWidget(BuildContext context, Contactmodel c1) {
  ContactProvider? providerr;
  ContactProvider? providerw;
  showDialog(
    context: context,
    builder: (context) {
      providerr = context.read<ContactProvider>();
      providerw = context.watch<ContactProvider>();

      TextEditingController txtName = TextEditingController(text: c1.name);
      TextEditingController txtEmail = TextEditingController(text: c1.email);
      TextEditingController txtNo = TextEditingController(text: c1.phone);
      return SingleChildScrollView(
        child: AlertDialog(
          title: Text("Update Contact"),
          actions: [
            Align(
              alignment: Alignment.center,
              child: c1.image == null
                  ? CircleAvatar(
                      radius: 40,
                      child: Text(
                        "${c1.name?.substring(0, 1).toUpperCase()}",
                        style: TextStyle(fontSize: 35),
                      ),
                    )
                  : CircleAvatar(
                      radius: 40,
                      backgroundImage: FileImage(File("${c1.image}")),
                    ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: IconButton(
                  onPressed: () async {
                    final PickedFile = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (PickedFile != null) {
                      providerr!.imagepath(PickedFile.path);
                    }
                  },
                  icon: Icon(Icons.image)),
            ),
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
              child: ElevatedButton(
                  onPressed: () {
                    Contactmodel cm = Contactmodel(
                        name: txtName.text,
                        phone: txtNo.text,
                        email: txtEmail.text,
                        image: c1.image);
                    context.read<ContactProvider>().updateData(cm);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Text("Update")),
            )
          ],
        ),
      );
    },
  );
}
