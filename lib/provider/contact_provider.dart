import 'package:flutter/material.dart';

class ContactProvider with ChangeNotifier{

  int stepIndex=0;
  String? imagePath;

  void nextpage()
  {
    if(stepIndex<3)
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
  void setimagepath(String? path)
  {
    imagePath = path;
    notifyListeners();
  }


}
