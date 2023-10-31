import 'package:contect_app/utils/shr_helper.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: IntroductionScreen(
             pages: [
               PageViewModel(
                 title: "Lorem Ipsum",
                 bodyWidget: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
                 image: Image.asset("assets/images/i1.png"),
               ),
               PageViewModel(
                   title: "simply dummy",
                   bodyWidget: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
                   image: Image.asset("assets/images/i2.png"),
               ),
             ],
            showDoneButton: true,
            onDone: () {
               Shrhelper shr = Shrhelper();
               shr.setintrostatus();
              Navigator.pushReplacementNamed(context, "home");
            },
            done: Text("Done"),
            showNextButton: true,
            next: Text("Next"),
          ),
        ),
      ),
    );
  }
}
