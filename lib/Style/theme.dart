import 'package:flutter/material.dart';
import 'package:top_care_graduation_project/Constant/Color.dart';
import 'package:top_care_graduation_project/Style/style.dart';

 ThemeData LightApp= ThemeData(
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
   bodyText1: txtStyle(Colors.black, 30.0, true),
   bodyText2: txtStyle(GrayColorLight, 15.0, false),
  ),

);