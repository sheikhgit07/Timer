import 'package:flutter/material.dart';
class CustomImage extends StatelessWidget {
   String? placeHolderImg;
   Color? placeHolderImgColor;
   CustomImage({
     this.placeHolderImg,
     this.placeHolderImgColor,
     Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      placeHolderImg??"assets/icons/preview.png",
      fit: BoxFit.cover,color: placeHolderImgColor,);
  }
}
