import 'package:contect_app/utils/shr_helper.dart';
import 'package:flutter/material.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({super.key});

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}
class _SpleshScreenState extends State<SpleshScreen> {
  @override
  void initState() {
    createdata();
    super.initState();
  }
  void createdata()async
  {
      Shrhelper status = Shrhelper();
      await status.getintrostatus();
  }
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, 'introScreen');
      },
    );
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Image.asset(
            "assets/images/logo.png",
            height: 150,
            width: 150,
          ),
        ),
      ),
    );
  }
}
