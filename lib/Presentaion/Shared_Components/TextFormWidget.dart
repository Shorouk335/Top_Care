import 'package:flutter/material.dart';
import 'package:top_care_graduation_project/Resource/Theme/Light_Theme.dart';

import 'package:top_care_graduation_project/Resource/Color_Manager/Color_Manager.dart';

// غلط عند ايكون الباسورد لا تتغير مره اخري
Widget TextFormWidget(
    {
    String? txt,
    IconData? icon,
    bool? password,
    TextEditingController? controller,
    void Function()? ontap
    }) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: TextFormField(
      controller: controller,
      // لاخفاء واظهار النص
      obscureText: password!,
      cursorColor: ColorManager.CyneColordark,
      validator: (value) {
        if (value!.isEmpty)
          return "$txt can't be empty";
        else
          return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorManager.GrayTextForm,
//استايل الكلام الخفي
        hintText: "$txt",
        hintStyle: txtStyle(Colors.grey, 15.0, false),
// الايكون الي في الاخر
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: ColorManager.CyneColorLight,
            child: (password)
                ? InkWell(
                    onTap: ontap,
                    child: Icon(
                      icon,
                      size: 20,
                      color: ColorManager.CyneColordark,
                    ),
                  )
                : Icon(
                    icon,
                    size:20,
                    color: ColorManager.CyneColordark,
                  ),
          ),
        ),
//حاله الفورم لو ضغط عليها
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.GrayTextForm,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
// حاله الفورم لو مضغطش
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.GrayTextForm,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}
