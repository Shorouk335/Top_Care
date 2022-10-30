import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:top_care_graduation_project/Style/style.dart';
import 'package:top_care_graduation_project/Constant/Color.dart';

Future<dynamic> ShowDialog(context, {String? img, String? txt, String? type}) {
  return AwesomeDialog(
    context: context,
    body: Column(
      children: [
        Image.asset(img!, width: 250),
        Text(
          "$txt",
          style: txtStyle(CyneColordark, 20.0, false),
        ),
        SizedBox(
          height: 50,
        ),
      ],
    ),
    dialogType: (type! == "error")
        ? DialogType.ERROR
        : ((type == "suc") ? DialogType.SUCCES : DialogType.WARNING),
    dialogBorderRadius: BorderRadius.circular(20.0),
    autoHide: Duration(seconds: 3),
  ).show();
}
