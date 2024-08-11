part of 'await_ocr_data_page.dart';

Widget _body(AwaitORCDataController controller) {
  return Stack(
    children: [
      Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.ASSETS_SVG_ICON_AWAIT_OCR_DATA_SVG),
            TextUtils(
              text: LocaleKeys.await_ocr_titleAwait.tr,
              availableStyle: StyleEnum.subBold,
              color: AppColors.basicBlack,
            ),
          ],
        ),
      ).paddingAll(AppDimens.padding15),
      Align(
        alignment: Alignment.bottomCenter,
        child: RichText(
          textAlign: TextAlign.center, // Căn giữa đoạn text
          text: TextSpan(
            text: LocaleKeys.await_ocr_titleHandmade.tr,
            style: FontStyleUtils.fontStyleSans(
              color: AppColors.colorBlack,
              fontSize: AppDimens.sizeTextSmaller,
              fontWeight: FontWeight.w400,
            ),
            children: [
              TextSpan(
                text: LocaleKeys.await_ocr_clickHandmade.tr,
                style: FontStyleUtils.fontStyleSans(
                  fontSize: AppDimens.sizeTextSmaller,
                  color: AppColors.primaryBlue1,
                  fontWeight: FontWeight.w700,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    controller.closeTime();
                    Get.toNamed(AppRoutes.routeConfirmInformation);

                  },
              ),
            ],
          ),
        ).paddingAll(AppDimens.padding15),
      )
    ],
  );
}
