
import 'package:flutter/material.dart';
class ThemeUtility{

  static const double baseHeight = 812.0;
  static const double baseWidth = 375.0;

  static double screenAwareHeight(double size, BuildContext context) {
    final double drawingHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return size * drawingHeight / baseHeight;
  }

  static double screenAwareWidth(double size, BuildContext context) {
    final double drawingWidth = MediaQuery.of(context).size.width;
    return size * drawingWidth / baseWidth;
  }

  // static Style textStyleToStyle(TextStyle textStyle){
  //   return Style(
  //     fontSize: FontSize(textStyle.fontSize!),
  //     fontFamily:textStyle.fontFamily,
  //     fontWeight: textStyle.fontWeight,
  //     color: textStyle.color,
  //   );
  // }
}