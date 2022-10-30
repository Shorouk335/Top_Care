import 'package:flutter/material.dart';
import 'package:top_care_graduation_project/Components/TextFormWidget.dart';
import 'package:top_care_graduation_project/Firebase/Auth.dart';
import 'package:top_care_graduation_project/Screens/Log_in.dart';
import 'package:top_care_graduation_project/Style/style.dart';
import 'package:top_care_graduation_project/Constant/Color.dart';


class SignUp extends StatefulWidget {

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool? hidePassword = true ;
  IconData PasswordIcon =Icons.visibility_off ;
  TextEditingController? email = TextEditingController();
  TextEditingController? password = TextEditingController();
  TextEditingController? username = TextEditingController();
  TextEditingController? phone = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height/6,),
                    SizedBox(height: 30,),
                    TextFormWidget(txt: "user name", icon: Icons.account_circle ,password: false,controller: username),
                    SizedBox(height: 10,),
                    TextFormWidget(txt: "email", icon: Icons.email ,password: false,controller: email),
                    SizedBox(height: 10,),
                    TextFormWidget(txt: "password",icon: PasswordIcon ,password: hidePassword ,controller: password,
                        ontap:  (){
                          setState(() {
                            hidePassword = !hidePassword!;
                            (hidePassword!)?(PasswordIcon = Icons.visibility_off ):(PasswordIcon = Icons.remove_red_eye_outlined);
                          });
                        } ),
                    SizedBox(height: 10,),
                    TextFormWidget(txt: "phone", icon: Icons.phone ,password: false,controller: phone),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("I Aready have An Account ?",style: txtStyle(Colors.grey, 15.0, false ),),
                        InkWell(
                          onTap:(){
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context){
                                  return LogIn();
                                }));
                          },
                          child: Text("Log In",
                             ),
                        ),
                      ],),
                    SizedBox(height: 10,),
                    TextButton(
                        onPressed: (){
                          if (formKey.currentState!.validate())
                          SignUpWithFire(context,email: email!.text,password: password!.text);
                          else
                            return null ;
                        },
                        child:Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,

                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.grey ,CyneColordark],
                                  begin: Alignment.bottomRight,
                                  end: Alignment.topCenter
                              ),
                              borderRadius: BorderRadius.circular(3030) ,
                              color: purpleColor
                          ),
                          child: Center(
                              child: Text("Sign Up",style: txtStyle(Colors.white, 30.0, false ),)

                          ),
                        )),
                    SizedBox(height: 20,),

                    Row (
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // FloatingActionButton(
                        //   heroTag: "1",
                        //   onPressed: ()async{
                        //   //  UserCredential u = await signInWithFacebook() ;
                        //   } ,
                        //   child: Icon(FontAwesomeIcons.facebook ,color: Colors.blue,size: 30,),
                        //   backgroundColor: Colors.white,
                        // ),
                        SizedBox(width: 50,),
                        // FloatingActionButton(
                        //   heroTag: "2",
                        //   onPressed: ()async{
                        // await SignInWithGoogle(context);
                        // } ,
                        //   child: Icon(FontAwesomeIcons.google ,color: Colors.red,size: 30,),
                        //   backgroundColor: Colors.white,
                        // ),

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
