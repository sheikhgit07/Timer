import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  CustomIcon({this.icon, this.height, this.color, Key? key}) : super(key: key);
  String? icon;
  double? height;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(icon ?? "", height: height ?? 20, color: color ?? Colors.transparent);
  }
}
