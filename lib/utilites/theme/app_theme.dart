import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loc_it/utilites/colors.dart';

import 'app_colors.dart';
import 'text.styles.dart';

// ignore: avoid_classes_with_only_static_members
class AppTheme {
  static String realEstatePlaceHolder = "";
  static String variousPlaceHolder = "";
  static String carsPlaceHolder = "";

  static ThemeData getLightModeTheme({String fontFamily = "Poppins"}) {
    realEstatePlaceHolder = "assets/icons/ic_realEstate_lightModePlace"
        "Holder.png";
    variousPlaceHolder = "assets/icons/ic_various_lightModePlaceHolder.png";
    carsPlaceHolder = "assets/icons/ic_cars_lightModePlaceHolder.png";
    return ThemeData(
      primarySwatch: primarySwatch,
      scaffoldBackgroundColor: AppColors.lightThemeColors['backgroundColor'],
      appBarTheme: const AppBarTheme(
        color: Color(0xFFffffff),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      // timePickerTheme: DatePickerThemeData(
      //     headerBackgroundColor: kPrimaryColor,
      //     headerForegroundColor: Colors.black,
      //     rangeSelectionBackgroundColor: kPrimaryColor,
      //     rangePickerShadowColor: Colors.white,
      //     rangePickerHeaderBackgroundColor: kPrimaryColor,
      //     elevation: 0,
      //     rangePickerElevation: 0,
      //     rangePickerHeaderForegroundColor: Colors.black),
      // bottomAppBarTheme: const BottomAppBarTheme(color: AppColors.white),
      // tabBarTheme: TabBarTheme(
      //   splashFactory: InkRipple.splashFactory,
      // ),
      // radioTheme: RadioThemeData(
      //   fillColor: kPrimaryColor,
      // ),
      // buttonColor: const Color(0xFFFFFFFF),
      buttonTheme: const ButtonThemeData(buttonColor: Color(0xff29313c)),
      chipTheme: const ChipThemeData(
        backgroundColor: Color(0xFF1f2630),
      ),
      iconTheme: const IconThemeData(color: Color(0xFF000000)),
      primaryColor: AppColors.primaryColorDark,
      // accentColor: AppColors.primaryColorDark,
      fontFamily: fontFamily,
      backgroundColor: AppColors.lightThemeColors['backgroundColor'],
      primaryColorDark: AppColors.primaryColorDark,
      cardColor: const Color(0xFFFFFFFF),
      dialogTheme: const DialogTheme(
          backgroundColor: Color(0xFFFFFFFF),
          titleTextStyle: TextStyle(
            color: Color(0xFF000000),
          )),
      canvasColor: AppColors.lightThemeColors['backgroundColor'],
      shadowColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      disabledColor: AppColors.grey,
      hintColor: AppColors.lightGrey,
      brightness: Brightness.light,
      bottomAppBarColor: AppColors.lightThemeColors['backgroundColor'],
      dialogBackgroundColor: AppColors.lightThemeColors['backgroundColor'],
      dividerColor: AppColors.lightThemeColors['backgroundColor'],
      //   cupertinoOverrideTheme: const CupertinoThemeData(),
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(10),
          focusedBorder: const UnderlineInputBorder(),
          errorStyle: subtitle2.copyWith(color: Colors.red),
          fillColor: const Color(0xFFFFFFFF),
          filled: true,
          isDense: true),
      textTheme: TextTheme(
        labelMedium: title1.copyWith(color: AppColors.black),
        headline1: headline1.copyWith(color: const Color(0xFF000000)),
        headline2: headline2.copyWith(color: AppColors.white),
        headline3: headline3.copyWith(color: AppColors.mediumBlueColor),
        headline4:
            headline4.copyWith(color: AppColors.lightThemeColors['textColor']),
        headline5:
            headline5.copyWith(color: AppColors.lightThemeColors['textColor']),
        headline6:
            headline6.copyWith(color: AppColors.lightThemeColors['textColor']),
        button: button.copyWith(color: AppColors.lightThemeColors['textColor']),
        caption:
            caption.copyWith(color: AppColors.lightThemeColors['textColor']),
        bodyText1: bodyText1.copyWith(color: const Color(0xff29313c)),
        bodyText2: bodyText2.copyWith(color: const Color(0xFFf5f5f5)),
        subtitle1: input.copyWith(color: Colors.black),
        //Color(0xFFe5eef5)),
        subtitle2: subtitle2.copyWith(color: Colors.grey.shade100),
      ),
    );
  }

  static ThemeData getDarkModeTheme({String fontFamily = "Poppins"}) {
    realEstatePlaceHolder = "assets/icons/ic_realEstate_placeHolder.png";
    variousPlaceHolder = "assets/icons/ic_various_placeHolder.png";
    carsPlaceHolder = "assets/icons/ic_cars_placeHolder.png";
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xFF1f2630),
      primarySwatch: primarySwatch,
      appBarTheme: const AppBarTheme(
        color: Color(0xFF020202),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xFF1f2630)),
      bottomAppBarColor: const Color(0xFF1f2630),
      iconTheme: const IconThemeData(color: Color(0xFFFFFFFF)),
      chipTheme: const ChipThemeData(
        backgroundColor: Color(0xFF1f2630),
      ),
      dialogTheme: const DialogTheme(
        backgroundColor: Color(0xFF1f2630),
        titleTextStyle: TextStyle(
          color: Color(0xFFFFFFFF),
        ),
        contentTextStyle: TextStyle(
          color: Color(0xFFFFFFFF),
        ),
      ),
      // buttonColor: const Color(0xFF5b7284),
      primaryColor: AppColors.primaryColorDark,
      // accentColor: AppColors.primaryColorDark,
      fontFamily: fontFamily,
      backgroundColor: const Color(0xFF1f2630),
      primaryColorDark: AppColors.primaryColorDark,
      cardColor: const Color(0xff201d1d),
      canvasColor: AppColors.black,
      shadowColor: const Color(0xFF757575),
      highlightColor: Colors.grey.shade100,
      disabledColor: AppColors.grey,
      hintColor: AppColors.lightGrey,
      brightness: Brightness.dark,
      dialogBackgroundColor: const Color(0xFF1f2630),
      dividerColor: AppColors.black,
      cupertinoOverrideTheme: const CupertinoThemeData(),
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(10),
          focusedBorder: const UnderlineInputBorder(),
          errorStyle: subtitle2.copyWith(color: Colors.red),
          fillColor: const Color(0xFF1f2630),
          filled: true),
      textTheme: TextTheme(
        labelMedium: title1.copyWith(color: AppColors.white),
        headline1: headline1.copyWith(color: const Color(0xFFFFFFFF)),
        headline2: headline2.copyWith(color: AppColors.black),
        headline3: headline3.copyWith(color: AppColors.black),
        headline4:
            headline4.copyWith(color: AppColors.darkThemeColors['textColor']),
        headline5:
            headline5.copyWith(color: AppColors.darkThemeColors['textColor']),
        headline6:
            headline6.copyWith(color: AppColors.darkThemeColors['textColor']),
        button: button.copyWith(color: AppColors.darkThemeColors['textColor']),
        caption:
            caption.copyWith(color: AppColors.darkThemeColors['textColor']),
        bodyText1: bodyText1.copyWith(color: const Color(0xFFFFFFFF)),
        bodyText2: bodyText2.copyWith(color: const Color(0xff29313c)),
        subtitle1: input.copyWith(color: const Color(0xFF1f2630)),
        subtitle2: subtitle2.copyWith(color: const Color(0xFF757575)),
      ),
    );
  }
}
