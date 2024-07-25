import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

/// [isDarkMode] hiện tại để 2 Theme dark và light
ThemeData getThemeByAppTheme([bool isDarkMode = true]) {
  ThemeData base = isDarkMode ? ThemeData.dark() : ThemeData.light();
  IconThemeData buildIconTheme() {
    Color iconColor = isDarkMode ? Colors.white : Colors.black;

    return IconThemeData(
      color: iconColor,
      size: 20.0,
    );
  }

  AppBarTheme buildAppBarTheme() {
    return base.appBarTheme.copyWith(
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: AppColors.appBarColor(),
            statusBarColor: AppColors.colorTransparent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark),
        color: AppColors.accentColorTheme(isDarkMode),
        iconTheme: buildIconTheme());
  }

  TextTheme basicTextTheme() {
    final TextTheme textTheme = base.textTheme;

    Color textColor = isDarkMode ? Colors.white : Colors.black87;
    Color subTextColor = isDarkMode ? Colors.white54 : Colors.black54;
    return TextTheme(
      // headline
      displayMedium: textTheme.displayMedium!.copyWith(
          fontSize: 36, fontWeight: FontWeight.bold, color: textColor),
      displaySmall: textTheme.displaySmall!.copyWith(
          fontSize: 32, fontWeight: FontWeight.bold, color: textColor),
      headlineMedium: textTheme.headlineMedium!.copyWith(
          fontSize: 26, fontWeight: FontWeight.bold, color: textColor),
      headlineSmall: textTheme.headlineSmall!.copyWith(
          fontSize: 24, fontWeight: FontWeight.bold, color: textColor),
      titleLarge:
          textTheme.headlineSmall!.copyWith(fontSize: 22, color: textColor),
      titleMedium:
          textTheme.titleMedium!.copyWith(fontSize: 20, color: textColor),
      // subtitle
      titleSmall: TextStyle(fontSize: 14, color: textColor),
      bodyLarge:
          textTheme.bodyLarge!.copyWith(fontSize: 16, color: subTextColor),
      // body
      bodyMedium:
          textTheme.bodyMedium!.copyWith(fontSize: 14, color: textColor),
      bodySmall:
          textTheme.bodySmall!.copyWith(fontSize: 12, color: subTextColor),
      // caption - chú thích trong app
      labelLarge:
          textTheme.labelLarge!.copyWith(fontSize: 16, color: textColor),
      // button
      labelSmall:
          textTheme.labelSmall!.copyWith(fontSize: 14, color: textColor),
    ).apply(
      fontFamily: 'NunitoSans',
    );
  }

  return base.copyWith(
      // themes
      textTheme: basicTextTheme(),
      iconTheme: buildIconTheme(),
      appBarTheme: buildAppBarTheme(),
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      bottomAppBarTheme: _buildBottomAppBarTheme(base),
      bottomSheetTheme: _buildBottomSheetTheme(base),
      tabBarTheme: base.tabBarTheme.copyWith(
        labelColor: isDarkMode ? AppColors.basicWhite : AppColors.primaryNavy,
        unselectedLabelColor: AppColors.basicGrey2,
      ),
      buttonTheme: _buildButtonTheme(base),
      cardTheme: _buildCardTheme(base, isDarkMode: isDarkMode),
      dialogTheme: _buildDialogTheme(base),

      // colors
      primaryColor: isDarkMode ? AppColors.basicGrey4 : AppColors.basicGrey4,
      indicatorColor: AppColors.primaryCam1,
      textButtonTheme: _textButtonThemeData(base),
      scaffoldBackgroundColor: AppColors.accentColorTheme(isDarkMode),
      // cardColor: isDarkMode ? AppColors.colorCard : Colors.pink[50],
      secondaryHeaderColor: isDarkMode
          ? AppColors.secondaryNavyPastel
          : AppColors.secondaryNavyPastel,
      // ignore: deprecated_member_use
      backgroundColor: isDarkMode ? AppColors.basicGrey4 : AppColors.basicGrey4,
      dialogBackgroundColor: AppColors.basicWhite);
}

ButtonThemeData _buildButtonTheme(ThemeData base) {
  return base.buttonTheme.copyWith(
      height: 50,
      minWidth: 5,
      // Them vao de context menu copy, paste tren Samsung khong bi soc vang
      buttonColor: AppColors.primaryCam1,
      textTheme: ButtonTextTheme.accent,
      colorScheme: base.colorScheme
          .copyWith(primary: Colors.white, secondary: Colors.white),
      // ignore: prefer_const_constructors
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ));
}

TextButtonThemeData _textButtonThemeData(ThemeData base) {
  return TextButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(base.textTheme.titleMedium),
      overlayColor: MaterialStateProperty.all(AppColors.basicWhite),
    ),
  );
}

BottomAppBarTheme _buildBottomAppBarTheme(ThemeData base) {
  return base.bottomAppBarTheme.copyWith(color: AppColors.basicGrey4);
}

BottomSheetThemeData _buildBottomSheetTheme(ThemeData base) {
  return base.bottomSheetTheme.copyWith(
    backgroundColor: AppColors.basicWhite,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
    ),
  );
}

CardTheme _buildCardTheme(ThemeData base, {bool isDarkMode = true}) {
  return base.cardTheme
      .copyWith(color: AppColors.secondaryCamPastel2, elevation: 0.0);
}

DialogTheme _buildDialogTheme(ThemeData base) {
  return base.dialogTheme
      .copyWith(backgroundColor: AppColors.basicWhite);
}
