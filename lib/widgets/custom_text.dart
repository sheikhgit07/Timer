import 'package:flutter/material.dart';
import 'package:loc_it/utilites/colors.dart';

class CustomText extends StatelessWidget {
  CustomText(
      {this.title,
      this.color = blackColor,
      this.fontSize = 14,
      this.fontWeight,
      this.fontStyle,
      this.textAlign,
      this.decoration,
      this.maxLines,
      this.fontFamily,
      this.height,
      this.decorationStyle,
      this.overflow,
      this.letterSpacing,
      Key? key})
      : super(key: key);
  String? title;
  Color? color;
  double? fontSize;
  FontWeight? fontWeight;
  FontStyle? fontStyle;
  TextAlign? textAlign;
  TextDecoration? decoration;
  int? maxLines;
  String? fontFamily;
  double? height;
  double? letterSpacing;
  TextOverflow? overflow;
  TextDecorationStyle? decorationStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? "",
      textAlign: textAlign ?? TextAlign.left,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
          decoration: decoration,
          decorationStyle: decorationStyle,
          fontStyle: fontStyle,
          letterSpacing: letterSpacing,
          fontFamily: fontFamily ?? "medium",
          height: height),
    );
  }
}
