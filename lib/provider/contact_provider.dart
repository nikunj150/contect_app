import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:share_plus/share_plus.dart';

import '../model/model_class.dart';

class ContactProvider with ChangeNotifier{

  int stepIndex=0;
  String? imagePath;
  int? infoIndex;


  // List<Color> colorList=[
  //   Colors.white,Colors.black,...Colors.primaries
  // ];

  List<Contactmodel>contactList=[];
  List<Contactmodel>privateContactList=[];

  void nextpage()
  {
    if(stepIndex<4)
      {
        stepIndex++;
      }
    notifyListeners();
  }
  void backpage()
  {
    if(stepIndex>0)
    {
      stepIndex--;
    }
    notifyListeners();
  }
  void imagepath(String? path)
  {
    imagePath = path;
    notifyListeners();
  }
  void storedata(Contactmodel cm)
  {
    contactList.add(cm);
    notifyListeners();
  }

  void privatedata(Contactmodel c1)
  {
    privateContactList.add(c1);
    notifyListeners();
  }

  void reset()
  {
    stepIndex=0;
  }

  void storeIndex(int index)
  {
    infoIndex = index;
    notifyListeners();
  }

  void deletedata()
  {
    contactList.removeAt(infoIndex!);
    notifyListeners();
  }
  void updateData(Contactmodel /*c1*/cm)
  {
    contactList[infoIndex!]=cm;
    notifyListeners();
  }
  Future<void> sharedata(Contactmodel c1)
  async {
    Share.share("${c1.name}\n${c1.phone}");
    ShareResult result = await Share.shareWithResult("");
  }

  void checkBiomatrixstatus()
  {
    LocalAuthentication auth = LocalAuthentication();
  }


}
