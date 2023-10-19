import 'package:flutter/material.dart';
import 'package:loc_it/utilites/string_utils.dart';
class AppColors {
  static const Color primaryColorDark = Color(0xFFF9C45A);
  static const Color HOME_BG = Color(0xffF0F0F0);
  static const Color IMAGE_BG = Color(0xffE2F0FF);
  static const Color redColor = Color(0xffFF0000);
  static const Color HINT_TEXT_COLOR = Color(0xff9E9E9E);
  static const Color COLUMBIA_BLUE = Color(0xff92C6FF);
  static const Color accentColor = Color(0xFFE6A537);
  static const Color SELLER_TXT = Color(0xff92C6FF);
  static const Color black = Color(0xFF252525);
  static const Color ICON_BG = Color(0xffF9F9F9);
  static const Color grey = Color(0xFF909090);
  static const Color LOW_GREEN = Color(0xffEFF6FE);
  static const Color lightGrey = Color(0xFFDADADA);
  static const Color YELLOW = Color(0xFFFFAA47);
  static const Color white = Color(0xFFFFFFFF);
  static const Color mediumBlueColor = Color(0xFFe2edff);
  static const Color bodyTextColorOverride = Color(0xFF020202);

  static Color bgndImage = HexColor('');
  static Color bgndColor = HexColor('');
  static Color textColor = HexColor('');
  static Color buttonColor = HexColor('');
  static Color buttonbgndColor = HexColor('');
  static Color cardbgndColor = HexColor('');
  static Color cardTxtColor = HexColor('');
  static Color priceColor = HexColor('');
  static Color wishlistColor = HexColor('');
  static Color linkColor = HexColor('');
  static Color qrCodeColor = HexColor('');
  static Color categoryIconColor = HexColor('');
  static Color categoryTextColor = HexColor('');
  static Color drawerBgndColor = HexColor('');
  static Color drawerTxtColor = HexColor('');
  static Color drawerIconColor = HexColor('');
  static Color logoBgndColor = HexColor('');
  static Color mapIconColor = HexColor('');
  static Color cityNameColor = HexColor('');
  static Color addressTextColor = HexColor('');
  static Color distanceTextColor = HexColor('');
  static Color activeColor = HexColor('');

  static void changeTheme(Map<String, dynamic> colorData) {
    bgndImage = colorData['bgndImage'] == null ? HexColor('#FF0000') : HexColor(colorData['bgndImage']);
    bgndColor = colorData['bgndColor'] == null ? HexColor('#FF0000') : HexColor(colorData['bgndColor']);
    textColor = colorData['textColor'] == null ? HexColor('#FF0000') : HexColor(colorData['textColor']);
    buttonColor = colorData['buttonColor'] == null ? HexColor('#FF0000') : HexColor(colorData['buttonColor']);
    buttonbgndColor = colorData['buttonbgndColor'] == null ? HexColor('#FF0000') : HexColor(colorData['buttonbgndColor']);
    cardbgndColor = colorData['cardbgndColor'] == null ? HexColor('#FF0000') : HexColor(colorData['cardbgndColor']);
    cardTxtColor = colorData['cardTxtColor'] == null ? HexColor('#FF0000') : HexColor(colorData['cardTxtColor']);
    priceColor = colorData['priceColor'] == null ? HexColor('#FF0000') : HexColor(colorData['priceColor']);
    wishlistColor = colorData['wishlistColor'] == null ? HexColor('#FF0000') : HexColor(colorData['wishlistColor']);
    linkColor = colorData['linkColor'] == null ? HexColor('#FF0000') : HexColor(colorData['linkColor']);
    qrCodeColor = colorData['qrCodeColor'] == null ? HexColor('#FF0000') : HexColor(colorData['qrCodeColor']);
    categoryIconColor = colorData['categoryIconColor'] == null ? HexColor('#FF0000') : HexColor(colorData['categoryIconColor']);
    categoryTextColor = colorData['categoryTextColor'] == null ? HexColor('#FF0000') : HexColor(colorData['categoryTextColor']);
    drawerBgndColor = colorData['drawerBgndColor'] == null ? HexColor('#FF0000') : HexColor(colorData['drawerBgndColor']);
    drawerTxtColor = colorData['drawerTxtColor'] == null ? HexColor('#FF0000') : HexColor(colorData['drawerTxtColor']);
    drawerIconColor = colorData['drawerIconColor'] == null ? HexColor('#FF0000') : HexColor(colorData['drawerIconColor']);
    logoBgndColor = colorData['logoBgndColor'] == null ? HexColor('#FF0000') : HexColor(colorData['logoBgndColor']);
    mapIconColor = colorData['mapIconColor'] == null ? HexColor('#FF0000') : HexColor(colorData['mapIconColor']);
    cityNameColor = colorData['cityNameColor'] == null ? HexColor('#FF0000') : HexColor(colorData['cityNameColor']);
    addressTextColor = colorData['addressTextColor'] == null ? HexColor('#FF0000') : HexColor(colorData['addressTextColor']);
    distanceTextColor = colorData['distanceTextColor'] == null ? HexColor('#FF0000') : HexColor(colorData['distanceTextColor']);
    activeColor = colorData['activeColor'] == null ? HexColor('#FF0000') : HexColor(colorData['activeColor']);
  }

  static Map<String, Color> lightThemeColors = {
    "backgroundColor": const Color(0xFFFFFFFF),
    "fastButtonBackgroundColor": const Color(0xFFfe9585),
    "barColor": const Color(0xFFfe9585),
    "srcColor": const Color(0xFFfcfcfc),
    "iconColor": const Color(0xFFdedcd9),
    "textColor": const Color(0xFF000000),
    "srcButtonColor": const Color(0xFFff0000),
    "menuColor": const Color(0xFFf5f5f5),
    "buttonColor": const Color(0xFFfe9585),
    "qrColor": const Color(0xFFe82326),
  };

  static Map<String, dynamic> darkThemeColors = {
    "backgroundColor": const Color(0xFFFFFFFF),
    "fastButtonBackgroundColor": const Color(0xFFfe9585),
    "barColor": const Color(0xFFfe9585),
    "srcColor": const Color(0xFFfcfcfc),
    "iconColor": const Color(0xFFdedcd9),
    "textColor": const Color(0xFF000000),
    "srcButtonColor": const Color(0xFFff0000),
    "menuColor": const Color(0xFFf5f5f5),
    "buttonColor": const Color(0xFFfe9585),
    "qrColor": const Color(0xFFe82326),
  };

  static const LinearGradient defaultGradient = LinearGradient(colors: [primaryColorDark, const Color(0xFFfe9585)]);

  static const Color facebookColor = Color(0xFF1976D2);

  static const Color appleColor = Color(0xFF000000);
}
