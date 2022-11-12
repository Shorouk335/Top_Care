import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:top_care_graduation_project/Presentaion/Shared_Components/AwesomDialog.dart';
import 'package:top_care_graduation_project/Resource/Asset_Manager/Asset_Manager.dart';
import 'package:top_care_graduation_project/Resource/Routes/Routes.dart';

// اوبجككت من الحساب الي هيدخل بيه
UserCredential? userCredential;

// للحصول علي معلومات المستخدم الحالي
Future getUserData() async {
  return await FirebaseAuth.instance.currentUser;
}

//تسجيل الخروج
Future SignOut() async {
  return await FirebaseAuth.instance.signOut();
}

// تسجبل الدخول بحساب موجود
Future LogInWithFire(BuildContext context,
    {String? email, String? password}) async {
  try {
    userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
    Navigator.pushReplacementNamed(context, RouteGenerator.HomeRoute);
  } on FirebaseAuthException catch (e) {
    if (e.code == "user-not-found") {
      ShowDialog(context,
          txt: "User not found", img: AssetManager.AwesomError, type: "error");
    } else if (e.code == "wrong-password") {
      ShowDialog(context,
          txt: "Wrong Password", img: AssetManager.AwesomError, type: "error");
    }
  } catch (e) {}
}

// انشاء حساب باميل وباسورد
Future SignUpWithFire(BuildContext context,
    {String? email, String? password}) async {
  try {
    userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
    Navigator.pushReplacementNamed(context, RouteGenerator.HomeRoute);
    //
    // if (userCredential!.user!.emailVerified == false) {
    //   User? user = FirebaseAuth.instance.currentUser;
    //   await user!.sendEmailVerification();
    // }
    // في حاله حدوث هذا الخطا
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      ShowDialog(context,
          txt: "Weak Password", img: AssetManager.AwesomError, type: "warning");
    } else if (e.code == 'email-already-in-use') {
      ShowDialog(context,
          txt: "Email already in use", img: AssetManager.AwesomError, type: "warning");
    }
    // لو خطا اخر
  } catch (e) {
    print(e);
  }
}
// التسجيل باكونت جوجل

// Future SignInWithGoogle(BuildContext context) async {
//   //عشان اجيب حساب جوجل
//   final GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();
//
//   //بعمل auth عشان اوصل لتفاصيل ال user
//   final GoogleSignInAuthentication? googleAuth =
//       await googleuser?.authentication;
//
//   //create credential
//   final OAuthCredential googleCred = await GoogleAuthProvider.credential(
//       accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
//
//   userCredential = await FirebaseAuth.instance
//       .signInWithCredential(googleCred);
//        Navigator.pushReplacementNamed(context, HomeScreen);
// }

//التسجيل بالفيس
// Future<UserCredential> signInWithFacebook() async {
//   // Trigger the sign-in flow
//   final LoginResult loginResult = await FacebookAuth.instance.login();
//
//   // Create a credential from the access token
//   final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(
//       loginResult.accessToken!.token);
//
//   // Once signed in, return the UserCredential
//   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
// }
