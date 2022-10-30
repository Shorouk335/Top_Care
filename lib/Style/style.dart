
 import 'package:flutter/material.dart';

TextStyle txtStyle (Color? color ,var size , bool weight ,String family){
  return TextStyle(
    color: color ,
    fontSize: size ,
    fontWeight: (weight)? FontWeight.bold : null ,
    decoration: TextDecoration.none,
    fontFamily: (family.isNotEmpty) ? family : null,
  );
 }