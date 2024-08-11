part of 'authentication_guide_page.dart';

Column _buildBody() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      sdsSB5,
      Center(
        child: Image.asset(Assets.ASSETS_JPG_IMG_CARD_CCCD_PNG),
      ),
      sdsSBHeight25,
      TextUtils(
        text: LocaleKeys.authentication_guide_verify_profile.tr,
        availableStyle: StyleEnum.subBold,
      ),
      sdsSBPadding,
      _buildTitleGuide(Assets.ASSETS_SVG_ICON_CARD_CCCD_SVG,
          LocaleKeys.authentication_guide_prepare_card.tr),
      // sdsSBHeight12,
      // _buildTitleGuide(Assets.ASSETS_SVG_ICON_LIST_SVG,
      //     LocaleKeys.authentication_guide_check_information.tr),
      sdsSBHeight12,
      _buildTitleGuide(Assets.ASSETS_SVG_ICON_NFC_CONNECT_SVG,
          LocaleKeys.authentication_guide_nfc_scan.tr),
      sdsSBHeight12,
      _buildTitleGuide(Assets.ASSETS_SVG_ICON_LIVE_NESS_SVG,
          LocaleKeys.authentication_guide_live_ness.tr),
    ],
  );
}

Widget _buildButton(AuthenticationGuideController controller) {
  return ButtonUtils.buildButton(
    LocaleKeys.registerCa_continue.tr,
    () {
      controller.checkAvailabilityNfc();
    },
    backgroundColor: AppColors.primaryBlue1,
    borderRadius: BorderRadius.circular(AppDimens.radius4),
    height: AppDimens.iconHeightButton,
  ).paddingSymmetric(
    horizontal: AppDimens.paddingDefaultHeight,
    vertical: AppDimens.padding10,
  );
}

Container _buildTitleGuide(String icon, String title) {
  return Container(
    height: AppDimens.btnMedium,
    color: AppColors.basicWhite,
    child: Row(
      children: [
        sdsSBWidth12,
        SvgPicture.asset(icon),
        sdsSBWidth12,
        TextUtils(
          text: title,
          availableStyle: StyleEnum.bodyBold,
        ),
      ],
    ),
  );
}
