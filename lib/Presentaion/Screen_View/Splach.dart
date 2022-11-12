import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:top_care_graduation_project/Resource/Asset_Manager/Asset_Manager.dart';
import 'package:top_care_graduation_project/Resource/Color_Manager/Color_Manager.dart';

import 'package:top_care_graduation_project/Resource/Routes/Routes.dart';
import 'package:top_care_graduation_project/Resource/String_Manager/String_Manager.dart';
import 'package:top_care_graduation_project/Resource/Theme/Light_Theme.dart';


class Splach extends StatefulWidget {
  @override
  State<Splach> createState() => _SplachState();
}

class _SplachState extends State<Splach> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4, milliseconds: 500), () {
      Navigator.pushReplacementNamed(context, RouteGenerator.OnBordingRoute);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Lottie.asset(AssetManager.LottieAnim,
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.height / 3,
                  fit: BoxFit.cover),
              AnimatedTextKit(
                totalRepeatCount: 1,
                animatedTexts: [
                  TyperAnimatedText(StringManager.SplachTxt1,
                      textStyle: txtStyle(ColorManager.CyneColordark, 45.0, true)),
                  TyperAnimatedText(StringManager.SplachTxt2,
                      textStyle: txtStyle(ColorManager.CyneColordark, 45.0, true)),
                  TyperAnimatedText(StringManager.SplachTxt3,
                      textStyle: txtStyle(ColorManager.CyneColordark, 45.0, true)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
