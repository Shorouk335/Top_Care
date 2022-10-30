import 'package:flutter/material.dart';
import 'package:top_care_graduation_project/Constant/PageName.dart';
import 'package:top_care_graduation_project/Firebase/Auth.dart';
import 'package:top_care_graduation_project/Firebase/store.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    //   getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await SignOut().then((value) => print("sign out "));
                Navigator.pushReplacementNamed(context, LoginScreen);
              },
              icon: Icon(Icons.exit_to_app)),
        ],
      ),
      body: Center(
        child: TextButton(
          onPressed: () {},
          child: Text(
            "Sign In",
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
