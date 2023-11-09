import 'dart:io';

import 'package:contect_app/model/model_class.dart';
import 'package:contect_app/provider/contact_provider.dart';
import 'package:contect_app/view/widget/alert_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  ContactProvider? providerr;
  ContactProvider? providerw;

  @override
  Widget build(BuildContext context) {
    providerr = context.read<ContactProvider>();
    providerw = context.watch<ContactProvider>();
    Contactmodel c1 =
        ModalRoute.of(context)!.settings.arguments as Contactmodel;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                providerr!.sharedata(c1);
              },
              icon: Icon(Icons.share)),
          title: Text("Information Screen"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  (c1.image == null)
                      ? CircleAvatar(
                          radius: 89,
                          child: Text(
                            "${c1.name?.substring(0, 1).toUpperCase()}",
                            style: TextStyle(fontSize: 40),
                          ),
                        )
                      : CircleAvatar(
                          radius: 89,
                          backgroundColor: Colors.blue,
                          backgroundImage: FileImage(File("${c1.image}")),
                        ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${c1.name}",
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () async {
                              Uri uri = Uri.parse("tel:+91${c1.phone}");
                              await launchUrl(uri);
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.green),
                              child: Icon(
                                Icons.call,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text("Call"),
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () async {
                              Uri uri = Uri.parse("sms:+91${c1.phone}");
                              await launchUrl(uri);
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.blue),
                              child: Icon(
                                Icons.sms_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text("Text"),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.blue.shade600),
                            child: Icon(
                              Icons.videocam,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text("Video"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black12,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Contact info",
                                style: TextStyle(fontSize: 19),
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () {
                                    showWidget(context, c1);
                                  },
                                  icon: Icon(Icons.edit)),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.star_border))
                            ],
                          ),
                          SizedBox(height: 40),
                          Row(
                            children: [
                              Icon(Icons.phone),
                              SizedBox(width: 10),
                              Text(
                                "${c1.phone}",
                                style: TextStyle(fontSize: 21),
                              ),
                              Spacer(),
                              Icon(Icons.videocam),
                              SizedBox(width: 20),
                              Icon(Icons.sms_outlined),
                            ],
                          ),
                          SizedBox(height: 30),
                          Row(
                            children: [
                              Text(
                                "${c1.email}",
                                style: TextStyle(fontSize: 20),
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () async {
                                    Uri uri = Uri.parse("mailto:${c1.email}");
                                    await launchUrl(uri);
                                  },
                                  icon: Icon(Icons.email_outlined)),
                            ],
                          ),
                          Spacer(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.red),
                                child: IconButton(
                                    onPressed: () {
                                      providerr!.deletedata();
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(Icons.delete)),
                              ),
                              SizedBox(width: 20),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.green),
                                child: IconButton(
                                    onPressed: () {
                                      providerr!.privatedata(c1);
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(Icons.lock)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
