import 'package:flutter/material.dart';
import 'package:top_care_graduation_project/Firebase/Auth.dart';
import 'package:top_care_graduation_project/Firebase/store.dart';
import 'package:top_care_graduation_project/Resource/Routes/Routes.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await SignOut().then((value) => print("sign out "));
                Navigator.pushReplacementNamed(context, RouteGenerator.LoginRoute);
              },
              icon: Icon(Icons.exit_to_app)),
        ],
      ),
      body: Center(
        child: Text(
          "Home",
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),
    );
  }
}
