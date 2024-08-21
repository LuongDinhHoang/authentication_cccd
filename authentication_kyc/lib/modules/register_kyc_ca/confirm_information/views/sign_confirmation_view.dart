part of 'confirm_information_page.dart';

Widget _buildSignConfirmation(ConfirmInformationController controller) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextUtils(
          text: LocaleKeys.registerCa_step5Final.tr,
          availableStyle: StyleEnum.subBold,
          color: AppColors.basicBlack,
        ),
        _buildCustomerInformation(controller),
        _buildExtend(
          LocaleKeys.registerCa_registrationForm.tr,
          () async {
            Get.toNamed(AppRoutes.routePdfRegistrationForm);
          },
        ),
        _buildPackage(controller),
        sdsSBHeight20,
        _buildSignature(controller),
        sdsSBHeight20,
        Obx(
          () => ButtonUtils.buildButton(
            LocaleKeys.registerCa_confirmButton.tr,
            () async {
              if (controller.isDrawing.value) {
                await controller
                    .confirmInfo()
                    .whenComplete(() => controller.hideLoading());
              }
            },
            isLoading: controller.isShowLoading.value,
            backgroundColor: controller.isDrawing.value
                ? AppColors.primaryBlue1
                : AppColors.basicGrey1,
            borderRadius: BorderRadius.circular(AppDimens.radius4),
            height: AppDimens.iconHeightButton,
          ),
        ),
        sdsSB8,
      ],
    ).paddingSymmetric(horizontal: AppDimens.padding16),
  );
}

Widget _buildPackage(ConfirmInformationController controller) {
  bool isViewPackage = true;
  return Visibility(
    visible: isViewPackage,
    child: Column(
      children: [
        sdsSBHeight20,
        ItemServiceView.buildItemSelectService(
          title: controller.nameServicePackage(controller
                  .appController.configCertificateModel.itemSelectPackage ??
              PackageInfoResponse()),
          colorBorder: AppColors.basicWhite,
          colorBackground: AppColors.basicWhite,
          isIconSeeMore: false,
          price: controller
              .appController.configCertificateModel.itemSelectPackage?.price,
          month: controller.appController.configCertificateModel
                  .itemSelectPackage?.expiry ??
              0,
          onTap: () {},
        ),
      ],
    ),
  );
}

Widget _buildSignature(ConfirmInformationController controller) {
  return Container(
    width: Get.width,
    height: AppDimens.height270,
    decoration: BoxDecoration(
      color: AppColors.basicWhite,
      borderRadius: BorderRadius.circular(AppDimens.radius4),
    ),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextUtils(
                text: LocaleKeys.registerCa_signConfirmation.tr,
                availableStyle: StyleEnum.subBold,
                color: AppColors.basicBlack,
              ),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    controller.signatureController.undo();
                  },
                  child: SvgPicture.asset(Assets.ASSETS_SVG_ICON_BACK_SVG),
                ),
                sdsSBWidth16,
                InkWell(
                  onTap: () {
                    controller.signatureController.clear();
                  },
                  child: SvgPicture.asset(Assets.ASSETS_SVG_ICON_DELETE_SVG),
                )
              ],
            ),
          ],
        ).paddingAll(AppDimens.padding16),
        _buildDrawSignature(controller),
      ],
    ),
  );
}

Widget _buildDrawSignature(ConfirmInformationController controller) {
  return SizedBox(
    width: Get.width,
    height: AppDimens.height200,
    child: Signature(
      controller: controller.signatureController,
      width: Get.width - AppDimens.btnMediumTb,
      height: AppDimens.height200,
      backgroundColor: AppColors.colorTransparent,
    ),
  );
}
