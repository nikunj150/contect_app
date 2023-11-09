

import 'package:contect_app/view/add_contact.dart';
import 'package:contect_app/view/contact_info_screen.dart';
import 'package:contect_app/view/home_screen.dart';
import 'package:contect_app/view/intro_screen.dart';
import 'package:contect_app/view/private_contact_screen.dart';
import 'package:contect_app/view/splesh_screen.dart';
import 'package:flutter/cupertino.dart';

Map<String,WidgetBuilder> app_routes={

  '/':(context) => SpleshScreen(),
  'introScreen':(context) => IntroScreen(),
  'home':(context) => HomeScreen(),
  'detailAdd':(context) => ContactAddScreen(),
  'info':(context) => InfoScreen(),
  'privateContact':(context) => PrivateScreen(),
};
