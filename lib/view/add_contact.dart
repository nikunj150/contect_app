import 'package:contect_app/provider/contact_provider.dart';
import 'package:flutter/material.dart';
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
        body: Consumer<ContactProvider>(
          builder: (context, value, child) => Stepper(
            currentStep: value.stepIndex,
            onStepContinue: () {
              value.nextpage();
            },
            onStepCancel: () {
              value.backpage();
            },
            steps: [
              Step(title: Text("image"), content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                CircleAvatar(
                backgroundColor: Colors.grey,),
                  SizedBox(width: 50,),
                  Container(
                    height: 30,
                    width: 70,
                    decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(5)),
                  ),
                ],
              ),),
              Step(title: Text("Name "), content: TextField(
                decoration: InputDecoration(
                  hintText: "Enter Your Name",
                ),
              )),
              Step(title: Text("Phone Number "), content: TextField(
                decoration: InputDecoration(
                  hintText: "Enter Your Number",
                ),
              )),
              Step(title: Text("email Address "), content:TextField(
                decoration: InputDecoration(
                  hintText: "Enter Your Gmail ID",
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
