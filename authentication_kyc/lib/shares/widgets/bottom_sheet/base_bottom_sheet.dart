import 'package:flutter/material.dart';

import '../../../core/core.src.dart';
import '../../shares.src.dart';
import '../text/font_style.dart';

class SDSBottomSheet extends StatelessWidget {
  const SDSBottomSheet({
    Key? key,
    required this.title,
    required this.body,
    this.iconTitle,
    this.actionArrowBack,
    this.padding,
    this.backgroundColor,
    this.textAlign,
    this.height,
    this.isSecondBottomsheet = false,
    this.noHeader = false,
  }) : super(key: key);

  final String title;
  final Widget body;
  final Widget? iconTitle;
  final bool isSecondBottomsheet;
  final Widget? actionArrowBack;
  final double? padding;
  final bool noHeader;
  final Color? backgroundColor;
  final TextAlign? textAlign;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      minimum: EdgeInsets.only(
          top: Get.mediaQuery.padding.top + (isSecondBottomsheet ? 100 : 20)),
      child: Container(
        height: height,
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.bottomSheet(),
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(AppDimens.radius20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag handle Icon
            Center(
              child: Container(
                height: AppDimens.padding4,
                width: AppDimens.btnMedium,
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppDimens.radius20)),
                  color: Colors.grey,
                ),
              ).paddingSymmetric(vertical: AppDimens.padding10),
            ),
            noHeader
                ? const SizedBox()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      actionArrowBack ??
                          const BackButton(
                            color: AppColors.basicGrey2,
                          ),
                      Expanded(
                        child: Text(
                          title.tr,
                          textAlign: textAlign ?? TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: FontStyleUtils.fontStyleSans(
                            fontSize: AppDimens.sizeTextMedium,
                          ),
                        ),
                      ),
                      iconTitle ??
                          const SizedBox(
                            width: 48, //size of Back Button
                          ),
                    ],
                  ),
            body,
          ],
        ).paddingSymmetric(horizontal: padding ?? AppDimens.padding16),
      ),
    );
  }
}
