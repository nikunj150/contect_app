import 'package:flutter/material.dart';

import '../model/model_class.dart';

class ContactProvider with ChangeNotifier{

  int stepIndex=0;
  String? imagePath;

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

}
