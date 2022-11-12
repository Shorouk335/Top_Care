import 'package:flutter/material.dart';
import 'package:top_care_graduation_project/Presentaion/Screen_View/HomeScreen.dart';
import 'package:top_care_graduation_project/Presentaion/Screen_View/Sign_in.dart';
import 'package:top_care_graduation_project/Presentaion/Screen_View/OnBoarding.dart';
import 'package:top_care_graduation_project/Presentaion/Screen_View/Sign_up.dart';
import 'package:top_care_graduation_project/Presentaion/Screen_View/Splach.dart';

class RouteGenerator {
  static const String SplachRoute = "/Splach";
  static const String OnBordingRoute = "OnBording";
  static const String LoginRoute = "Login";
  static const String SignUpRoute = "SignUp";
  static const String HomeRoute = "Home";

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteGenerator.SplachRoute:
        return MaterialPageRoute(builder: (_) => Splach());
      case RouteGenerator.OnBordingRoute:
        return MaterialPageRoute(builder: (_) => OnBoarding());
      case RouteGenerator.HomeRoute:
        return MaterialPageRoute(builder: (_) => Home());
      case RouteGenerator.LoginRoute:
        return MaterialPageRoute(builder: (_) => SignIn());
      case RouteGenerator.SignUpRoute:
        return MaterialPageRoute(builder: (_) => SignUp());

      default:
        return UnDefinedRoute();
    }
  }

  static Route<dynamic> UnDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text("NOT FOUND"),
        ),
      ),
    );
  }
}
