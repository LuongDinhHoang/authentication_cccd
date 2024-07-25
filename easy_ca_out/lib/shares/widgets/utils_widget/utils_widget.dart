import 'package:easy_ca/assets.dart';
import 'package:easy_ca/core/core.src.dart';
import 'package:easy_ca/generated/locales.g.dart';
import 'package:easy_ca/shares/shares.src.dart';
import 'package:easy_ca/shares/widgets/text/font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as badges;
import 'package:url_launcher/url_launcher.dart';

class UtilWidget {
  static Widget buildLoading(Color? colorIcon) {
    return CupertinoActivityIndicator(
      color: colorIcon ?? AppColors.basicBlack,
    );
  }

  /// Loading cho child
  static Widget baseShowLoadingChild({
    required WidgetCallback child,
    required bool isShowLoading,
    Color? colorIcon,
  }) {
    return isShowLoading ? Center(child: buildLoading(colorIcon)) : child();
  }

  //
  // /// Loading cho child
  // static Widget baseShowLoadingChildSize({
  //   required WidgetCallback child,
  //   required bool isShowLoading,
  //   Color? colorIcon,
  //   required double width,
  //   required double height,
  // }) {
  //   return isShowLoading
  //       ? SizedBox(
  //           width: width,
  //           height: height,
  //           child: Center(
  //             child: buildLoading(colorIcon: colorIcon),
  //           ),
  //         )
  //       : child();
  // }

  static Widget buildCheckBox(RxBool checkBoxValue, String textBox,
      {Color? activeColor, TextStyle? styleTextBox}) {
    return Row(
      children: [
        Obx(
          () => Theme(
            data: Theme.of(Get.context!).copyWith(
              unselectedWidgetColor: AppColors.primaryCam1,
            ),
            child: Checkbox(
                activeColor: activeColor ?? AppColors.primaryCam1,
                value: checkBoxValue.value,
                onChanged: (value) {
                  checkBoxValue.toggle();
                }),
          ),
        ),
        TextUtils(
          text: textBox.tr,
          availableStyle: StyleEnum.bodyRegular,
          color: AppColors.colorBlack,
        )
      ],
    );
  }

  static Widget buildPermission(RxBool isCheckbox) {
    return Row(
      children: [
        UtilWidget.buildCheckBox(isCheckbox, ""),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: LocaleKeys.registerCa_iAgree.tr,
              style: FontStyleUtils.fontStyleSans(
                color: AppColors.basicBlack,
                fontSize: AppDimens.sizeTextSmall,
                fontWeight: FontWeight.w400,
              ),
              children: [
                TextSpan(
                  text: LocaleKeys.registerCa_termsPolicy.tr,
                  style: FontStyleUtils.fontStyleSans(
                    color: AppColors.primaryCam1,
                    fontSize: AppDimens.sizeTextSmall,
                    fontWeight: FontWeight.w400,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.toNamed(AppRoutes.routeTermsAndPolicies);
                    },
                ),
                TextSpan(
                  text: LocaleKeys.registerCa_dataProcessing.tr,
                  style: FontStyleUtils.fontStyleSans(
                    color: AppColors.colorBlack,
                    fontSize: AppDimens.sizeTextSmall,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: LocaleKeys.registerCa_EasyCA.tr,
                  style: FontStyleUtils.fontStyleSans(
                    color: AppColors.primaryCam1,
                    fontSize: AppDimens.sizeTextSmall,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ).paddingOnly(right: AppDimens.padding12);
  }

  static Widget buildEmptyList() {
    return Center(
      child: SvgPicture.asset(Assets.ASSETS_SVG_ICON_LIST_NULL_SVG),
    );
  }

  /// URL launcher
  static Future<void> launchInBrowser(String url) async {
    Uri uri;
    if (url.contains('https')) {
      uri = Uri.parse(url);
    } else {
      if (url.contains('softDream.com')) {
        uri = Uri(
          scheme: 'mailto',
          path: url,
        );
      } else {
        uri = Uri(
          scheme: 'tel',
          path: url,
        );
      }
    }
    if (await launchUrl(uri)) {
      /*bool resultLaunch = */ await launchUrl(uri,
          mode: LaunchMode.externalApplication);
    }
    /* if(!resultLaunch){
        if(Get.isDialogOpen == true){
          Get.back();
        }
      }
    } else {
      if(Get.isDialogOpen == true){
        Get.back();
      }
    }*/
  }

// static Widget buildSolidButton({
//   required String title,
//   VoidCallback? onPressed,
//   double? width,
//   double? height,
// }) {
//   return SizedBox(
//     // color:  AppColors.primaryCam1,
//     width: width,
//     height: height ?? AppDimens.iconHeightButton,
//     child: ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         elevation: 0.0,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(6),
//         ),
//         backgroundColor: AppColors.primaryCam1,
//       ),
//       child: TextUtils(
//         text: title,
//         availableStyle: StyleEnum.subBold,
//         color: AppColors.colorWhite,
//       ),
//     ),
//   );
// }

  /// Icon trống của app
// static Widget baseEmpty({String? icon}) {
//   return Container(
//     alignment: Alignment.center,
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SvgPicture.asset(icon ?? ImageAsset.iconEmpty),
//         const SizedBox(
//           height: 10,
//         ),
//         const TextUtils(
//           text: AppStr.empty,
//           availableStyle: StyleEnum.titleLarge,
//           color: AppColors.colorTitleOption,
//         )
//       ],
//     ),
//   );
// }
//
// static Widget buildShimmerLoading() {
//   const padding = AppDimens.defaultPadding;
//   return Container(
//     width: double.infinity,
//     padding:
//         const EdgeInsets.symmetric(horizontal: padding, vertical: padding),
//     child: Column(
//       mainAxisSize: MainAxisSize.max,
//       children: <Widget>[
//         Expanded(
//           child: Shimmer.fromColors(
//             baseColor: Colors.grey.shade400,
//             highlightColor: Colors.grey.shade100,
//             enabled: true,
//             child: ListView.separated(
//               itemBuilder: (context, index) => Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     height: 24.0,
//                     decoration: const BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(10),
//                       ),
//                     ),
//                   ),
//                   sizedBox10,
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Container(
//                           height: 16.0,
//                           decoration: const BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(10),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 30,
//                       ),
//                       Expanded(
//                         child: Container(
//                           height: 16.0,
//                           decoration: const BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(10),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   sizedBox10,
//                 ],
//               ),
//               separatorBuilder: (context, index) => const Divider(
//                 height: 15,
//               ),
//               itemCount: 10,
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
  // static  Widget buildBadge(int count, ){
  //   return
  // }
  static Widget badgeCount({required int count, required Widget child}) {
    return badges.Badge(
      showBadge: count > 0,
      badgeStyle: count > 99
          ? badges.BadgeStyle(
              badgeColor: AppColors.statusRed,
              shape: badges.BadgeShape.square,
              borderRadius: BorderRadius.circular(AppDimens.radius20),
            )
          : const badges.BadgeStyle(
              badgeColor: AppColors.statusRed,
            ),
      badgeAnimation: const badges.BadgeAnimation.scale(),
      position: badges.BadgePosition.topEnd(
        top: -10,
        end: count >= 10
            ? count > 99
                ? -10
                : -12
            : -8,
      ),
      badgeContent: count > 0
          ? TextUtils(
              text: count > 99 ? '99+' : count.toString(),
              availableStyle: StyleEnum.detailBold,
              color: AppColors.basicWhite,
            )
          : null,
      child: child,
    );
  }
}
