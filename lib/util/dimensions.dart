import 'package:get/get.dart';
import '../helper/responsive_helper.dart';

class Dimensions {
  static double fontSizeExtraSmall =
      Responsive.isTab() ? 12 : (Get.width >= 1300 ? 14 : 10);
  static double fontSizeSmall =
      Responsive.isTab() ? 24 : (Get.width >= 1300 ? 16 : 12);
  static double fontSizeDefault = 16;
  static double fontSizeLarge =
      Responsive.isTab() ? 20 : (Get.width >= 1300 ? 20 : 16);
  static double fontSizeExtraLarge =
      Responsive.isTab() ? 28 : (Get.width >= 1300 ? 22 : 18);
  static double fontSizeOverLarge =
      Responsive.isTab() ? 34 : (Get.width >= 1300 ? 28 : 24);
  static const double PADDING_SIZE_EXTRA_EXTRA_SMALL = 2.0;
  static const double PADDING_SIZE_EXTRA_SMALL = 6.0;
  static const double PADDING_SIZE_SMALL = 10.0;
  static const double PADDING_SIZE_DEFAULT = 15.0;
  static const double HOME_PAGE_PADDING = 16.0;
  static const double PADDING_SIZE_DEFAULT_ADDRESS = 17.0;
  static const double PADDING_SIZE_LARGE = 20.0;
  static const double PADDING_SIZE_EXTRA_LARGE = 25.0;
  static const double PADDING_SIZE_Thirty_Five = 30.0;
  static const double PADDING_SIZE_OVER_LARGE = 50.0;
  static const double MARGIN_SIZE_EXTRA_SMALL = 5.0;
  static const double MARGIN_SIZE_SMALL = 10.0;
  static const double MARGIN_SIZE_DEFAULT = 15.0;
  static const double MARGIN_SIZE_LARGE = 20.0;
  static const double MARGIN_SIZE_EXTRA_LARGE = 25.0;
  static const double MARGIN_SIZE_AUTH_SMALL = 30.0;
  static const double MARGIN_SIZE_OVER_LARGE = 40.0;
  static const double MARGIN_SIZE_AUTH = 50.0;
  static const double BORDER_RADIUS = 4.0;
  static double iconSizeSmall = 24;
  static double iconSizeExtraSmall = 20;
  static double iconDefaultSize = 28;
  static double iconSizeMedium = Responsive.isTab() ? 28 : (Get.width >= 1300 ? 22 : 20);
  static double iconSizeDefault = Responsive.isTab() ? 34 : (Get.width >= 1300 ? 28 : 24);
  static double iconSizeMediumLarge = Responsive.isTab() ? 48 : (Get.width >= 1300 ? 42 : 38);
  static const double IMAGE_SIZE_EXTRA_SEVENTY = 70.0;
  static const double topSpace = 30.0;
  static const double splashLogoWidth = 150.0;
  static const double chooseReviewImageSize = 40.0;
  static const double profileImageSize = 100.0;
  static const double LOGO_HEIGHT = 80.0;
}
