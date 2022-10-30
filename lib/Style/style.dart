
 import 'package:flutter/material.dart';

TextStyle txtStyle (Color color ,var doublesize , bool weight){
  return TextStyle(
    color: color ,
    fontSize: doublesize ,
    fontWeight: (weight)? FontWeight.bold : null ,
    decoration: TextDecoration.none,
  );
 }