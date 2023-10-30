import 'dart:io';

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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Detail Screen"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Consumer<ContactProvider>(
                builder: (context, value, child) => Stepper(
                  currentStep: value.stepIndex,
                  onStepContinue: () {
                    value.nextpage();
                  },
                  onStepCancel: () {
                    value.backpage();
                  },
                  steps: [
                    Step(
                      title: Text("image"),
                      content: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey,
                            backgroundImage: value.imagePath != null
                                ? FileImage(File(value.imagePath!))
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
                    const Step(
                        title: Text("Name "),
                        content: TextField(
                          decoration: InputDecoration(
                            hintText: "Enter Your Name",
                          ),
                        )),
                    Step(
                        title: Text("Phone Number"),
                        content: TextField(
                          decoration: InputDecoration(
                            hintText: "Enter Your Number",
                          ),
                        )),
                    Step(
                        title: Text("email Address "),
                        content: TextField(
                          decoration: InputDecoration(
                            hintText: "Enter Your Gmail ID",
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Submit")),
            ],
          ),
        ),
      ),
    );
  }
}
