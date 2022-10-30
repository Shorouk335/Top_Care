import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:top_care_graduation_project/Constant/PageName.dart';
import 'package:top_care_graduation_project/Firebase/Auth.dart';
import 'package:top_care_graduation_project/Firebase/store.dart';
import 'package:top_care_graduation_project/Screens/HomeScreen.dart';
import 'package:top_care_graduation_project/Screens/Log_in.dart';
import 'package:top_care_graduation_project/Screens/OnBoarding.dart';
import 'package:top_care_graduation_project/Screens/Sign_up.dart';
import 'package:top_care_graduation_project/Screens/Splach.dart';
import 'package:top_care_graduation_project/Style/theme.dart';
//bool? IsLogin ;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  // لربط الفير بيز بالابلكيشن
   await Firebase.initializeApp();

   //لمعرفة المستخدم مسجل دخول ولا لا
  //  var user = await getUserData();
  // if (user == null)
  //   {
  //     IsLogin =false ;
  //   }
  //  else
  //    {
  //      IsLogin = true;
  //    }
  //

  runApp( MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent ,
        statusBarIconBrightness: Brightness.dark
    ));
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      initialRoute: SplachScreen ,
      //(IsLogin== true)? HomeScreen : SplachScreen ,
      routes:{
        SplachScreen :(context)=> Splach(),
        OnBordingScreen :(context)=> OnBoarding(),
        LoginScreen :(context)=> LogIn(),
        SignUpScreen :(context)=> SignUp(),
        HomeScreen :(context)=>Home(),
      } ,
      theme: LightApp,
    );

  }

}
