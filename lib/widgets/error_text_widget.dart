import 'package:flutter/material.dart';

import '../utilites/colors.dart';
import 'custom_text.dart';

class ErrorTextWidget extends StatelessWidget {
  const ErrorTextWidget({Key? key, this.titleColor, this.subTitleColor})
      : super(key: key);
  final Color? titleColor;
  final Color? subTitleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 10),
          CustomText(
              title: 'Sorry !', fontSize: 30, color: titleColor ?? blackColor),
          SizedBox(height: 5),
          CustomText(
              title: "No Data Found",
              color: subTitleColor ?? blackColor,
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
