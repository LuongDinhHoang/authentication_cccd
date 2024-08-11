part of 'instruct_live_ness_kyc_page.dart';

Widget _body() {
  return SizedBox(
    height: Get.height,
    width: Get.width,
    child: Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: SvgPicture.asset(
                        Assets.ASSETS_SVG_ICON_INSTRUCT_LIVE_NESS_SVG)),
                TextUtils(
                  text: LocaleKeys.live_ness_instructTitle.tr,
                  availableStyle: StyleEnum.subBold,
                  color: AppColors.basicBlack,
                ).paddingOnly(
                    bottom: AppDimens.padding5, top: AppDimens.padding30),
                _titleInstruct(),
              ],
            ).paddingAll(AppDimens.padding15),
          ),
        ),
        _buildButtonContinue(),
      ],
    ),
  );
}

Widget _titleInstruct() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      sdsSB5,
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: TextUtils(
              text: LocaleKeys.update_information_kyc_Number1.tr,
              availableStyle: StyleEnum.bodyRegular,
              color: AppColors.basicBlack,
            ),
          ),
          Expanded(
            child: TextUtils(
              text: LocaleKeys.live_ness_Step1.tr,
              // availableStyle: StyleEnum.bodyRegular,
              color: AppColors.basicBlack,
              maxLine: 4,
              size: AppDimens.sizeTextSmallTb,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      sdsSB5,
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: TextUtils(
              text: LocaleKeys.update_information_kyc_Number2.tr,
              // availableStyle: StyleEnum.bodyRegular,
              color: AppColors.basicBlack,
              size: AppDimens.sizeTextSmallTb,
              fontWeight: FontWeight.w400,
            ),
          ),
          Expanded(
            child: TextUtils(
              text: LocaleKeys.live_ness_Step2.tr,
              // availableStyle: StyleEnum.bodyRegular,
              color: AppColors.basicBlack,
              size: AppDimens.sizeTextSmallTb,
              fontWeight: FontWeight.w400,
              maxLine: 2,
            ),
          ),
        ],
      ),
      sdsSB5,
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: TextUtils(
              text: LocaleKeys.update_information_kyc_Number3.tr,
              // availableStyle: StyleEnum.bodyRegular,
              color: AppColors.basicBlack,
              size: AppDimens.sizeTextSmallTb,
              fontWeight: FontWeight.w400,
            ),
          ),
          Expanded(
            child: TextUtils(
              text: LocaleKeys.live_ness_Step3.tr,
              // availableStyle: StyleEnum.bodyRegular,
              color: AppColors.basicBlack,
              maxLine: 2,
              size: AppDimens.sizeTextSmallTb,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      sdsSB5,
      TextUtils(
        text: LocaleKeys.live_ness_Step4.tr,
        // availableStyle: StyleEnum.bodyRegular,
        color: AppColors.basicBlack,
        maxLine: 3,
        size: AppDimens.sizeTextSmallTb,
        fontWeight: FontWeight.w400,
      ),
    ],
  ).paddingOnly(bottom: AppDimens.padding5);
}

Widget _buildButtonContinue() {
  return ButtonUtils.buildButton(LocaleKeys.nfc_buttonStart.tr, () async {
    Get.toNamed(
      AppRoutes.routeLiveNessKyc,
    );
  },
          backgroundColor: AppColors.primaryBlue1,
          borderRadius: BorderRadius.circular(AppDimens.radius4),
          colorText: AppColors.basicWhite)
      .paddingAll(AppDimens.padding15);
}
