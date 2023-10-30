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
        body: IntroductionScreen(
           pages: [
             PageViewModel(
               title: "Lorem Ipsum ",
               bodyWidget: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
               image: Image.asset("assets/images/intro1.jpg"),
             ),
             PageViewModel(
                 title: "simply dummy",
                 bodyWidget: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
                 // image: Image.asset("assets/images/intro1.jpg"),
             ),
           ],
          showDoneButton: true,
          onDone: () {
             Shrhelper shrhelper = Shrhelper();
             shrhelper.setintrostatus();
            Navigator.pushReplacementNamed(context, "home");
          },
          done: Text("Next"),
          showNextButton: true,

          next: Text("Done"),
        ),
      ),
    );
  }
}
