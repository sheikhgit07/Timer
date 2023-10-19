import 'package:flutter/material.dart';

const kMainColor = Color(0xFFFFFFFF);
const kSecondaryColor = Color(0xFFfb2b4d);
const kPinkColor = Color(0xFFF5B6BE);
const kPinkColor2 = Color(0xFFf42654);
const kDarkGrayColor = Color(0xFF5C5C5C);
const kLightGrayColor = Color(0x995C5C5C);
const kLighterGrayColor = Color(0x775C5C5C);
const kLighterGrayColor2 = Color(0x60C2C2C2);
const kLightergrayColor = Color(0xffF1F1F1);
const backgroundColor = Color.fromRGBO(19, 28, 33, 1);
const textColor = Color.fromRGBO(241, 241, 242, 1);
const appBarColor = Color.fromRGBO(31, 44, 52, 1);
const webAppBarColor = Color.fromRGBO(42, 47, 50, 1);
const messageColor = Color.fromRGBO(5, 96, 98, 1);
const senderMessageColor = Color.fromRGBO(37, 45, 49, 1);
const tabColor = Color.fromRGBO(0, 167, 131, 1);
const searchBarColor = Color.fromRGBO(50, 55, 57, 1);
const dividerColor = Color.fromRGBO(37, 45, 50, 1);
const chatBarMessage = Color.fromRGBO(30, 36, 40, 1);
const mobileChatBoxColor = Color.fromRGBO(31, 44, 52, 1);
//const greyColor = Color(0xFF9a9a9c);

//
const MaterialColor primarySwatch = MaterialColor(0xFF000000, <int, Color>{
  50: Color(0xFFE0E0E0),
  100: Color(0xFFB3B3B3),
  200: Color(0xFF808080),
  300: Color(0xFF555555),
  400: Color(0xFF333333),
  500: Color(0xFF000000), // Primary color (Black)
  600: Color(0xFF000000),
  700: Color(0xFF000000),
  800: Color(0xFF000000),
  900: Color(0xFF000000),
});

const Color kPrimaryColor = Colors.black;
const Color scaffoldBackgroundColor = Color(0xFFFFFFFF);
const Color whiteColor = Color(0xFFFFFFFF);
const Color greyColor = Color(0xFF9a9a9c);
const darkGreyColor = Color(0xFFb9b8af);
const lightGreyColor = Color(0xFFe4e4e4);
const extralightGreyColor = Color(0xFFe8e8e9);
const extraLightGreyColor = Color(0xFFf8f8f8);
const borderColor = Color(0xFF9a9a9c);
const blackColor = Colors.black;
const buttonsColor = Color(0xFFefefe3);

const Color lightBlueColor = Color(0xFFf2f6ff);
const Color lightBlueColor2 = Color(0xFFe5eef5);
const Color mediumBlueColor = Color(0xFFe2edff);
const Color purpleColor = Color(0xFF9455e9);
const Color greenColor = Color(0xFF069d7d);
const Color lightGrey = Color(0xFFf4f7fc);
const Color mediumGreyColor = Color(0x909D9D9D);
//const Color extraLightGreyColor = Color(0x80C2C2C2);
const Color redColor = Color(0xFFfb3434);
const Color yellowColor = Color(0xFFFED13E);
const Color orangeColor = Color(0xFFd88067);
const Color orangeColor2 = Color(0xFFE7C294);
const Color fbColor = Color(0xFF39569f);
const Color IMAGE_BG = Color(0xffE2F0FF);
const Color mediumGreenColor = Color(0xFF74D345);
const Color lightGreenColor1 = Color(0xFFD3F2C4);
const Color lightGreenColor = Color(0xFF60EDAC);
const Color lightGreenAccentColor = Color(0xFFF1FFFB);
const Color blueColor = Color(0xFF0057B8);
const Color blueColor2 = Color(0xFF2D76C5);
const Color mediumBlueColor2 = Color(0xFFF9F9F9);
const Color darkBlueColor = Color(0xFF1a2f66);
const Color lightblueColor = Color(0xFFECF5FF);

const Color lightPurpleColor = Color(0xFFFFF5F5);
const Color cursorColor = Color(0xFF0057B8);

const Color hintTextColor = Color(0xFF808080);
const Color iconColor = Color(0xFF363636);
const Color boxBgColor = Color(0xFFF9F9F9);
const Color darkBgColor = Color(0xFFE0E0E0);
const Color textGreyColor = Color(0xFF808080);
const Color textGreyColor2 = Color(0xFF707070);
const Color textRedColor = Color(0xFFFF464C);

const Color kButtonColor = Color(0xFFC51F30);
const Color kBackgroundColor = Colors.white;
const Color kBlackColor = Colors.black;
const Color kTextFieldBackground = Color(0xFFF9F6F6);
const Color kFbColor = Color(0xFF3B5998);
const Color kGoogleColor = Color(0xFFEA4335);
const Color kAccentColor = Color(0xffFCAAAB);
const Color kAccentColorVariant = Color(0xffF7A3A2);
const Color kUnreadChatBG = Color(0xffEE1D1D);

extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
      //hexColor2 = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      //  print(hexColor);
      return Color(int.parse("0x$hexColor"));
    }
  }
}
