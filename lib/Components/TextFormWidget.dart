import 'package:flutter/material.dart';
import 'package:top_care_graduation_project/Style/style.dart';
import 'package:top_care_graduation_project/Constant/Color.dart';

// غلط عند ايكون الباسورد لا تتغير مره اخري
Widget TextFormWidget(
    {String? txt,
    IconData? icon,
    bool? password,
    TextEditingController? controller,
    void Function()? ontap}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: TextFormField(
      controller: controller,
      // لاخفاء واظهار النص
      obscureText: password!,
      cursorColor: blueColor,
      validator: (value) {
        if (value!.isEmpty)
          return "$txt can't be empty";
        else
          return null;
      },
      decoration: InputDecoration(
//استايل الكلام الخفي
        hintText: "$txt",
        hintStyle: txtStyle(Colors.grey, 15.0, false, ""),
// الايكون الي في الاخر
        suffixIcon: (password)
            ? InkWell(
                onTap: ontap,
                child: Icon(
                  icon,
                  size: 28,
                  color: Colors.grey,
                ),
              )
            : Icon(
                icon,
                size: 28,
                color: Colors.grey,
              ),
//حاله الفورم لو ضغط عليها
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black26,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
// حاله الفورم لو مضغطش
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black26),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
  );
}
