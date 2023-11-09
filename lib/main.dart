import 'package:contect_app/provider/contact_provider.dart';
import 'package:contect_app/provider/theme_provider.dart';
import 'package:contect_app/utils/app_routes.dart';
import 'package:contect_app/utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider(),),
        ChangeNotifierProvider(create: (context) => ContactProvider(),),
      ],
      child: ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: Consumer<ThemeProvider>(
          builder: (context, value, child) => MaterialApp(
            theme: value.isLight?lightTheme:darkTheme,
            debugShowCheckedModeBanner: false,
            routes: app_routes,
          ),
        ),
      ),
    ),
  );
}
