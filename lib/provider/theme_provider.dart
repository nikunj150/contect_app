import 'package:flutter/cupertino.dart';

class ThemeProvider with ChangeNotifier
{
  bool isLight= false;

  void changeTheme()
  {
    isLight=!isLight;

    notifyListeners();
  }

}