import 'package:contect_app/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Consumer<ThemeProvider>(
              builder: (context, value1, child) => Switch(
                value: value1.isLight,
                onChanged: (value) {
                  value1.changeTheme();
                },
              ),
            ),
          ],
          title: Text("Contact List"),
        ),
        body: Column(
          children: [

          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
          Navigator.pushNamed(context,'detailAdd');
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
