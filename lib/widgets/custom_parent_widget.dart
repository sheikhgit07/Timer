import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomParentWidget extends StatelessWidget {
  CustomParentWidget({this.child, Key? key}) : super(key: key);
  Widget? child;


  @override
  Widget build(BuildContext context) {
    late MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return MediaQuery(data: queryData.copyWith(textScaleFactor: 1.0),
        child:AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent, // Color for Android
              statusBarIconBrightness: Brightness.light,
              systemNavigationBarColor: Colors.transparent,
              systemNavigationBarIconBrightness: Brightness.dark
            ),
            sized: false,
            child: child ?? SizedBox()));
  }
}
