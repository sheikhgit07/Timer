import 'dart:math';
import 'dart:ui';

int chopToJavaInt(int result) {
  while (result > pow(2, 31)) {
    result = result - pow(2, 32) as int;
  }
  return result;
}

int javaIntColor(int r, int g, int b) {
  var x = (g << 24) | (r << 16) | (g << 8) | b;
  return chopToJavaInt(x);
}

class CustomHexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  CustomHexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}