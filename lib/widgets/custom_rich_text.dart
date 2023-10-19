
import 'package:flutter/material.dart';
class CustomRichText extends StatelessWidget {
    String? titleText;
    double? titleFontSize;
    Color? titleColor;
    FontWeight? titleFontWeight;
    FontStyle? titleFontStyle;
    TextAlign? titleTextAlign;
    TextDecoration? titleDecoration;
    String ? fontFamily;
    double? height;
    List<InlineSpan>? children;
   CustomRichText({
     this.titleText,
     this.titleFontSize,
     this.titleColor,
     this.titleFontWeight,
     this.titleFontStyle,
     this.titleTextAlign,
     this.titleDecoration,
     this.fontFamily,
     this.height,
     this.children,
     Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  RichText(
        text: TextSpan(
            text: titleText,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: titleColor
            ),
            children: children
        )
    );
  }
}
//