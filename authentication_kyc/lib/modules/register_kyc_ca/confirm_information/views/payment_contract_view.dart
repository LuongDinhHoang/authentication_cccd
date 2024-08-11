part of 'confirm_information_page.dart';

// Widget _buildPaymentContract(ConfirmInformationController controller) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       TextUtils(
//         text: LocaleKeys.registerCa_step4PaymentContract.tr,
//         availableStyle: StyleEnum.subBold,
//         color: AppColors.basicBlack,
//       ),
//       _buildCustomerInformation(controller),
//       _buildOrderInformation(),
//       _buildExtend(LocaleKeys.registerCa_contractService.tr, () {}),
//       const SizedBox(
//         height: AppDimens.btnSmall,
//       ),
//       ButtonUtils.buildButton(
//         LocaleKeys.registerCa_continue.tr,
//         () {
//           controller.pageViewController.animateToPage(
//               controller.currentPageIndex.value + 1,
//               duration: const Duration(milliseconds: 500),
//               curve: Curves.ease);
//         },
//         backgroundColor: AppColors.primaryCam1,
//         borderRadius: BorderRadius.circular(AppDimens.radius4),
//         height: AppDimens.iconHeightButton,
//       ),
//       const SizedBox(
//         height: AppDimens.btnSmall,
//       ),
//     ],
//   ).paddingSymmetric(horizontal: AppDimens.padding16);
// }

Widget _buildCustomerInformation(ConfirmInformationController controller) {
  return Container(
    width: Get.width,
    decoration: BoxDecoration(
      color: AppColors.basicWhite,
      borderRadius: BorderRadius.circular(AppDimens.radius4),
    ),
    child: Obx(
      ()=> Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextUtils(
            text: LocaleKeys.registerCa_customerInformation.tr,
            availableStyle: StyleEnum.bodyBold,
          ),
          sdsSBDefault,
          _buildItemInformation(Assets.ASSETS_SVG_ICON_USER_NAME_CARD_SVG,
              controller.textEditingName.text),
          sdsSBDefault,
          _buildItemInformation(Assets.ASSETS_SVG_ICON_CARD_INFO_SVG,
              controller.textEditingCCCD.text),
          sdsSBDefault,
          _buildItemInformation(Assets.ASSETS_SVG_ICON_BIRTHDAY_SVG,
              controller.textDateOfBirth.value),
          sdsSBDefault,
          _buildItemInformation(
              Assets.ASSETS_SVG_ICON_GENDER_SVG, controller.textSex.value),
          sdsSBDefault,
          _buildItemInformation(Assets.ASSETS_SVG_ICON_CANLENDAR_CARD_SVG,
              controller.textDateOfIssue.value),
          sdsSBDefault,
          _buildItemInformation(Assets.ASSETS_SVG_ICON_MAP_SVG,
              controller.textEditingHomeTown.text),
          sdsSBDefault,
          _buildItemInformation(Assets.ASSETS_SVG_ICON_MAP_SVG,
              controller.textEditingPermanentAddress.text),
        ],
      ).paddingAll(AppDimens.padding16),
    ),
  ).paddingOnly(top: AppDimens.padding10, bottom: AppDimens.padding16);
}

Widget _buildItemInformation(String icon, String content) {
  return Row(
    children: [
      SvgPicture.asset(icon),
      sdsSBWidth10,
      Expanded(
        child: TextUtils(
          text: content,
          availableStyle: StyleEnum.bodyRegular,
          maxLine: 3,
        ),
      ),
    ],
  );
}

Widget _buildOrderInformation() {
  return Container(
    width: Get.width,
    decoration: BoxDecoration(
        color: AppColors.basicWhite,
        borderRadius: BorderRadius.circular(AppDimens.radius4),
        border: Border.all(color: AppColors.primaryBlue1)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextUtils(
          text: LocaleKeys.registerCa_orderInformation.tr,
          availableStyle: StyleEnum.subBold,
        ),
        sdsSBDefault,
        _buildDetailOder(LocaleKeys.registerCa_servicePrices.tr, "0đ"),
        sdsSBDefault,
        _buildDetailOder(LocaleKeys.registerCa_easyCaToken.tr, "0đ"),
        sdsSBDefault,
        _buildDetailOder(LocaleKeys.registerCa_totalMoney.tr, "0đ"),
        sdsSBDefault,
        _buildDetailOder(LocaleKeys.registerCa_vat.tr, "0đ"),
        sdsSBDefault,
        _buildDetailOder(LocaleKeys.registerCa_totalCost.tr, "0đ",
            isTotalCost: true)
      ],
    ).paddingAll(AppDimens.padding16),
  ).paddingOnly(bottom: AppDimens.padding16);
}

Widget _buildDetailOder(String title, String money,
    {bool isTotalCost = false}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      TextUtils(
        text: title,
        availableStyle:
            isTotalCost ? StyleEnum.bodyBold : StyleEnum.bodyRegular,
        color: isTotalCost ? AppColors.basicBlack : AppColors.basicGrey1,
      ),
      TextUtils(
        text: money,
        availableStyle: StyleEnum.bodyRegular,
        color: AppColors.primaryBlue1,
      ),
    ],
  );
}

Widget _buildExtend(String title, VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: Get.width,
      height: AppDimens.sizeWidth60,
      decoration: BoxDecoration(
        color: AppColors.basicWhite,
        borderRadius: BorderRadius.circular(AppDimens.radius4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextUtils(
            text: title,
            availableStyle: StyleEnum.subBold,
          ).paddingOnly(left: AppDimens.padding16),
          TextUtils(
            text: LocaleKeys.registerCa_view.tr,
            availableStyle: StyleEnum.subBold,
            color: AppColors.primaryBlue1,
          ).paddingOnly(right: AppDimens.padding16),
        ],
      ),
    ),
  );
}
