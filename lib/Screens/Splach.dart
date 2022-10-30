import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:top_care_graduation_project/Constant/Color.dart';
import 'package:top_care_graduation_project/Constant/PageName.dart';
import 'package:top_care_graduation_project/Screens/OnBoarding.dart';
import 'package:top_care_graduation_project/Style/style.dart';

class Splach extends StatefulWidget {
  @override
  State<Splach> createState() => _SplachState();
}

class _SplachState extends State<Splach> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4,milliseconds: 500), () {
     Navigator.pushReplacementNamed(context, OnBordingScreen);
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Lottie.asset('assets/lottie_json/lf30_editor_wr2nsawi.json',
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.height / 3,
                    fit: BoxFit.cover),
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText('Welcom !',
                        textStyle: txtStyle(CyneColor, 45.0, true, "")),
                    TyperAnimatedText('to ..',
                        textStyle: txtStyle(CyneColor, 45.0, true, "")),
                    TyperAnimatedText('Top Care',
                        textStyle: txtStyle(CyneColor, 45.0, true, "")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
