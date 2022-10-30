import 'package:flutter/material.dart';
import 'package:top_care_graduation_project/Models/PageViewModel.dart';

Widget PageViewItem({
  required PageViewModel? model,
  required BuildContext context,
}) {
  return Column(
      children: [
        SizedBox(height: 50,),
        Text("${model?.title}",
            style: Theme.of(context).textTheme.bodyText1),
        SizedBox(height: 20,),
        Text("${model?.disc}",
            style: Theme.of(context).textTheme.bodyText2, maxLines: 2),
        Center(
            child: Image(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/2.4,
                image: AssetImage(
                    "assets/images/${model?.img}"),
                fit: BoxFit.contain,
            )),

      ],
  );
}
