import 'package:flutter/material.dart';

class CustomImage2 extends StatelessWidget {
  String? img;
  double? scale;
  Color? color;
  CustomImage2({this.img, this.scale,this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(img ?? "assets/icons/ic_app.png", scale: scale ?? 3,color: color,);
  }
}
