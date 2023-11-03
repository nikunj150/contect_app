import 'package:contect_app/model/model_class.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    Contactmodel c1=ModalRoute.of(context)!.settings.arguments as Contactmodel;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Information Screen"),),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  CircleAvatar(
                  radius: 89,
                    backgroundColor: Colors.blue,
              ),
                  SizedBox(height: 20,),
                  Text("${c1.name}",style: TextStyle(fontSize: 30),),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                     Column(
                       children: [
                         Container(
                           height: 50,
                           width: 50,
                           decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.green),
                           child: Icon(Icons.call,color: Colors.white,),
                         ),
                         SizedBox(height: 10),
                         Text("Call"),
                       ],
                     ),
                     Column(
                       children: [
                         Container(
                           height: 50,
                           width: 50,
                           decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.blue),
                           child: Icon(Icons.sms_outlined,color: Colors.white,),
                         ),
                         SizedBox(height: 10),
                         Text("Text"),
                       ],
                     ),
                     Column(
                       children: [
                         Container(
                           height: 50,
                           width: 50,
                           decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.blue.shade600),
                           child: Icon(Icons.videocam,color: Colors.white,),
                         ),
                         SizedBox(height: 10),
                         Text("Video"),
                       ],
                     ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: MediaQuery.sizeOf(context).height*0.40,
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
                              Text("Contact info",style: TextStyle(fontSize: 19),),
                              Spacer( ),
                              IconButton(onPressed: () {

                              }, icon: Icon(Icons.edit,color: Colors.white,)),
                              IconButton(onPressed: () {

                              }, icon:Icon(Icons.star_border,color: Colors.white,))
                            ],
                          ),
                          SizedBox(height: 40),
                          Row(
                            children: [
                              Icon(Icons.phone,color: Colors.white),
                              SizedBox(width: 10),
                              Text("${c1.phone}",style: TextStyle(fontSize: 21),),
                              Spacer( ),
                              Icon(Icons.videocam,color: Colors.white,),
                              SizedBox(width: 20),
                              Icon(Icons.sms_outlined,color: Colors.white,),
                            ],
                          ),
                          SizedBox(height: 30),
                          Text("${c1.email}",style: TextStyle(fontSize: 20),),
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
