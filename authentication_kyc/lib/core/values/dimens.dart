import 'package:get/get.dart';

// Tỉ lệ chiều cao so với màn hình thiết kế
double ratioHeight = Get.height / AppDimens.heightDesign;
// Tỉ lệ chiều ngang so với màn hình thiết kế
double ratioWidth = Get.width / AppDimens.widthDesign;

class AppDimens {
  /// Giá trị px màn hình Mobile design trên figma
  static const int heightDesign = 812;
  static const int widthDesign = 375;
  static const double iconLoginWidth = 77;
  static const double iconLogoWidth = 190;
  static const double iconLogoHeight = 42;
  static const double iconAccWidth = 22;
  static const double iconAccHeight = 35;
  static const double iconCheckmark = 70;
  static const double heightBottomTabBar = 80;
  static const double heightBottomTabBarAndroid = 75;
  static const double paddingSmallBottomNavigation = 6.0;
  static const double paddingBottomTabBar = 18.0;
  static const double paddingTabBar = 5.0;
  static const double sizeBorderNavi = 30.0;

  ///padding
  static const double padding1 = 1.0;
  static const double padding2 = 2.0;
  static const double padding3 = 3.0;
  static const double padding4 = 4.0;
  static const double padding5 = 5.0;
  static const double padding6 = 6.0;
  static const double padding8 = 8.0;
  static const double padding10 = 10.0;
  static const double padding15 = 15.0;
  static const double padding20 = 20.0;
  static const double padding22 = 22.0;
  static const double padding25 = 25.0;
  static const double padding30 = 30.0;
  static const double padding40 = 40.0;
  static const double padding50 = 50.0;
  static const double padding60 = 60.0;
  static const double padding80 = 80.0;
  static const double padding78 = 78.0;
  static const double paddingDefault = 8.0;
  static const double scrollPadding = 150;
  static const double scrollPaddingDefault = 100;
  static const double paddingTop = 24;
  static const double padding12 = 12;
  static const double padding16 = 16;
  static const double paddingDefaultHeight = 16;
  static const double paddingPositionPhone = 140;
  static double fontSmallest() => 12.divSF;
  static double fontSmall() => 14.divSF;

  /// Text size
  static const double sizeTextSmallest = 10;
  static const double sizeTextSmaller = 12;
  static const double sizeTextSmall = 14;
  static const double sizeTextSmallTb = 15;
  static const double sizeTextMediumTb = 16;
  static const double sizeTextMedium = 18;
  static const double sizeTextLarge = 20;
  static const double sizeTextSupperLarge = 24;
  static const double sizeImg = 163;
  static const double size45 = 45;

  /// Button size
  static const double btnSmall = 20;
  static const double btnMediumTb = 40;
  static const double btnMediumMax = 44;
  static const double btnMedium = 50;
  static const double iconHeightButton = 38;


  /// Radius
  static const double minRadius = 4;


  ///icon size
  static const double iconMedium = 24;
  static const double iconSize30 = 30;

  ///size radius
  static const double radius1 = 1;
  static const double radius8 = 8;
  static const double radius4 = 4;
  static const double radius10 = 10;
  static const double radius20 = 20;
  static const double radius18 = 18;

  ///widget size
  static const double sizeWidth60 = 60;
  static const double height100 = 100;
  static const double height110 = 110;
  static const double height200 = 200;
  static const double height270 = 270;
  static const List<double> dashPattern = [10, 5];
  static const double sizeWeight3 = 3;
  static const double sizeWeight1 = 1;
  static const double sizeImage = 50;
  static const double sizeImageMedium = 70;
  static const double sizeImageBig = 90;
  static const double sizeImageLarge = 200;


  ///scale widget
  static const double scale08 = 0.8;


}

extension GetSizeScreen on num {
  /// Tỉ lệ fontSize của các textStyle
  double get divSF {
    return this / Get.textScaleFactor;
  }

  // Tăng chiều dài theo font size
  double get mulSF {
    return this * Get.textScaleFactor;
  }
}
