import 'package:flutter/material.dart';

import '../model/model_class.dart';

class ContactProvider with ChangeNotifier{

  int stepIndex=0;
  String? imagePath;
  int? infoIndex;


  List<Color> colorList=[
    Colors.white,Colors.black,...Colors.primaries
  ];

  List<Contactmodel>contactList=[];

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

  }


  void updateData(Contactmodel c1)
  {
    contactList[infoIndex!]=c1;
    notifyListeners();
  }

}
