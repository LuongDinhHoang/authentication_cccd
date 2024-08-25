import 'package:two_id_c06verify/core/core.src.dart';
import 'package:two_id_c06verify/shares/shares.src.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BackgroundAppBar {
  static PreferredSizeWidget buildAppBar(
    String title, {
    Color? textColor,
    Color? actionsIconColor,
    Color backButtonColor = AppColors.colorBlack,
    Color? backgroundColor,
    bool centerTitle = false,
    StyleEnum? availableStyle,
    FontWeight fontWeight = FontWeight.w400,
    Function()? funcLeading,
    bool leading = true,
    List<Widget>? actions,
    bool isColorGradient = false,
    List<Color>? colorTransparent,
    TabBar? widget,
    Widget? titleWidget,
    bool statusBarIconBrightness = false,
    bool isContinuous = true,
    double? iconSize,
  }) {
    return AppBar(
      bottom: widget,
      actionsIconTheme:
          IconThemeData(color: actionsIconColor ?? AppColors.basicBlack),
      systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: AppColors.appBarColor(),
          statusBarColor: AppColors.colorTransparent,
          statusBarBrightness:
              statusBarIconBrightness ? Brightness.dark : Brightness.light,
          statusBarIconBrightness:
              statusBarIconBrightness ? Brightness.light : Brightness.dark),
      title: titleWidget ??
          TextUtils(
            text: title,
            availableStyle: availableStyle ?? StyleEnum.subBold,
            color: textColor ?? AppColors.basicBlack,
            textAlign: TextAlign.center,
            maxLine: 2,
          ),
      automaticallyImplyLeading: false,
      centerTitle: centerTitle,
      leading: !leading
          ? null
          : ButtonUtils.baseOnAction(
              onTap: () {
                if (funcLeading != null) {
                  funcLeading();
                } else {
                  Get.back();
                }
              },
              child: IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.chevron_left,
                  color: backButtonColor ?? AppColors.basicBlack,
                  size: iconSize ?? AppDimens.iconMedium,
                ),
              ),
              isContinuous: isContinuous,
            )
      /*BackButton(
              color: backButtonColor ?? AppColors.textColorDefault,
              onPressed: funcLeading,
            )*/
      ,
      // flexibleSpace: isColorGradient
      //     ? Container(
      //   decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //       begin: Alignment.bottomLeft,
      //       end: Alignment.bottomRight,
      //       colors: colorTransparent ??
      //           <Color>[
      //             AppColors.colorBackgroundLight,
      //             AppColors.colorBackgroundLight,
      //           ],
      //     ),
      //   ),
      // )
      //     : null,
      actions: actions,
      backgroundColor: backgroundColor,
      // isColorGradient ? null : backgroundColor ?? AppColors.colorWhite,
      titleSpacing: titleWidget == null ? null : 0,
    );
  }
}
