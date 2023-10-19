import 'package:flutter/material.dart';

class CustomInkWell extends StatelessWidget {
  CustomInkWell({this.onTap, this.onLongPress,this.onHover,this.child, Key? key}) : super(key: key);
  Function? onTap;
  Function? onLongPress;
  Function(bool)? onHover;
  Widget? child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onHover: (val){
        onHover!;
      },
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        onTap!();
      },
      onLongPress: (){
        FocusScope.of(context).requestFocus(FocusNode());
        onLongPress!();
      },
      child: child,
    );
  }
}
