import 'package:flutter/material.dart';
import 'package:top_care_graduation_project/Presentaion/Shared_Components/TextFormWidget.dart';
import 'package:top_care_graduation_project/Resource/Color_Manager/Color_Manager.dart';
import 'package:top_care_graduation_project/Firebase/Auth.dart';
import 'package:top_care_graduation_project/Presentaion/Screen_View/Sign_up.dart';
import 'package:top_care_graduation_project/Resource/Routes/Routes.dart';
import 'package:top_care_graduation_project/Resource/Theme/Light_Theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool hidePassword = true;
  bool Checkvalue = false;
  IconData PasswordIcon = Icons.visibility_off;
  TextEditingController? email = TextEditingController();
  TextEditingController? password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Sign In',
                  style: txtStyle(ColorManager.CyneColordark, 30.0, true),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Welcom back! please enter your details',
                  style: txtStyle(ColorManager.GrayColorLight, 15.0, false),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                TextFormWidget(
                    txt: "email",
                    icon: Icons.email,
                    password: false,
                    controller: email),
                SizedBox(
                  height: 15,
                ),
                TextFormWidget(
                    txt: "password",
                    icon: PasswordIcon,
                    password: hidePassword,
                    controller: password,
                    ontap: () {
                      setState(() {
                        hidePassword = !hidePassword;
                        (hidePassword)
                            ? (PasswordIcon = Icons.visibility_off)
                            : (PasswordIcon = Icons.remove_red_eye);
                      });
                    }),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Checkbox(
                        activeColor: ColorManager.CyneColordark,
                        checkColor: Colors.white,
                        value: Checkvalue,
                        onChanged: (Checkvalue) {
                          setState(() {
                            this.Checkvalue = !this.Checkvalue;
                          });
                        }),
                    Text(
                      "Remamber",
                      style: txtStyle(ColorManager.GrayColorLight, 15.0, false),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 8,
                ),
                TextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate())
                        LogInWithFire(context,email: email!.text,password:password!.text);
                      else
                        return null;
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorManager.CyneColordark),
                      child: Center(
                          child: Text(
                        "Sign In",
                        style: txtStyle(Colors.white, 25.0, false),
                      )),
                    )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Create an Account",
                      style: txtStyle(ColorManager.CyneColordark, 15.0, false),
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, RouteGenerator.SignUpRoute);
                      },
                      child: Text(
                        "Sign Up",
                        style:
                            txtStyle(ColorManager.CyneColordark, 15.0, false),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      FontAwesomeIcons.facebook,
                      color: Colors.blue,
                      size: 40,
                    ),
                    Icon(
                      FontAwesomeIcons.google,
                      color: Colors.red,
                      size: 40,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
