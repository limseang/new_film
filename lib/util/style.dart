import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dimensions.dart';

const robotoRegular = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w400,
);

const robotoMedium = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w500,
);

const robotoBold = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w700,
);

const robotoBlack = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w900,
);


final textStyleRegular = TextStyle(
  fontFamily: 'Inter',
  // fontFamily: Get.find<LocalizationController>().locale.languageCode == 'km'? 'Dangrek' : 'Roboto',
  fontWeight: FontWeight.w400,
  color: Color(0xffA0A0A0),
  fontSize: Dimensions.fontSizeDefault,
);

final textStyleLowMedium = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w500,
  fontSize: Dimensions.fontSizeDefault,
);

final textStyleMedium = TextStyle(
  fontFamily: 'Cabin',
  fontWeight: FontWeight.w600,
  fontSize: Dimensions.fontSizeDefault,
);

final textStyleBold = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w700,
  fontSize: Dimensions.fontSizeDefault,
);

final textStyleBlack = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w900,
  fontSize: Dimensions.fontSizeDefault,
);

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    if (hexColor == null || hexColor.isEmpty) {
      hexColor = '#03A9F4';
    }
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
