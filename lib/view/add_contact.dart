import 'dart:io';

import 'package:contect_app/model/model_class.dart';
import 'package:contect_app/provider/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ContactAddScreen extends StatefulWidget {
  const ContactAddScreen({super.key});

  @override
  State<ContactAddScreen> createState() => _ContactAddScreenState();
}

class _ContactAddScreenState extends State<ContactAddScreen> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtNo = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  ContactProvider? providerw;
  ContactProvider? providerr;

  @override
  Widget build(BuildContext context) {
    providerw = context.watch<ContactProvider>();
    providerr = context.read<ContactProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Detail Screen"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stepper(
                currentStep: providerw!.stepIndex,
                onStepContinue: () {
                  providerw!.nextpage();
                },
                onStepCancel: () {
                  providerr!.backpage();
                },
                steps: [
                  Step(
                    title: Text("image"),
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        (providerw!.imagePath==null)?Image.asset("assets/images/user.png",height: 100,):CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey,
                          backgroundImage: providerw!.imagePath != null
                              ? FileImage(File(providerw!.imagePath!))
                              : null,
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Consumer<ContactProvider>(
                          builder: (context, value, child) => IconButton(
                              onPressed: () async {
                                final PickedFile = await ImagePicker()
                                    .pickImage(source: ImageSource.gallery);
                                if (PickedFile != null) {
                                  value.imagepath(PickedFile.path);
                                }
                              },
                              icon: Icon(Icons.image)),
                        ),
                      ],
                    ),
                  ),
                  Step(
                      title: Text("Name"),
                      content: TextField(
                        controller: txtName,
                        decoration: InputDecoration(
                          hintText: "Enter Your Name",
                        ),
                      )),
                  Step(
                      title: Text("Phone Number"),
                      content: TextField(
                        keyboardType: TextInputType.number,
                        controller: txtNo,
                        decoration: InputDecoration(
                          hintText: "Enter Your Number",
                        ),
                      )),
                  Step(
                      title: Text("email Address "),
                      content: TextField(
                        controller: txtEmail,
                        decoration: InputDecoration(
                          hintText: "Enter Your Gmail ID",
                        ),
                      )),
                  Step(
                    title: Text("submit"),
                    content: ElevatedButton(
                      onPressed: () {
                        Contactmodel cm = Contactmodel(
                          name:txtName.text,
                         phone: txtNo.text,
                         email: txtEmail.text,
                          image: providerw!.imagePath,
                        );
                        providerw!.storedata(cm);

                        providerw!.reset();

                        Navigator.pop(context,);
                      },
                      child: Text("save"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
