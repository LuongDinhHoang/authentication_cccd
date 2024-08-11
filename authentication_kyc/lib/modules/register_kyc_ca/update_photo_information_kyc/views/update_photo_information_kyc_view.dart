part of 'update_photo_information_kyc_page.dart';

Widget _body(UpdateInformationController controller) {
  return Column(
    children: [
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                text: LocaleKeys.update_information_kyc_step2Kyc.tr,
                availableStyle: StyleEnum.subBold,
                color: AppColors.basicBlack,
              ),
              _imageBuilder(controller),
              TextUtils(
                text: LocaleKeys.update_information_kyc_user_manual.tr,
                availableStyle: StyleEnum.subBold,
                color: AppColors.basicBlack,
              ).paddingOnly(bottom: AppDimens.padding5),
              _titleInstruct().paddingOnly(bottom: AppDimens.padding80),
            ],
          ).paddingAll(AppDimens.padding15),
        ),
      ),
      _buildButtonContinue(controller).paddingAll(AppDimens.padding15)
    ],
  );
}

Widget _imageBuilder(UpdateInformationController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Expanded(
            child: _itemPhotoCard(
              onTap: () => controller.routeTakePicture(true),
              urlImage: controller.filesImageFront.fileData,
              textTitle: LocaleKeys.update_information_kyc_frontIdentityCard.tr,
            ),
          ),
          sdsSBWidth20,
          Expanded(
            child: _itemPhotoCard(
                onTap: () => controller.routeTakePicture(false),
                urlImage: controller.filesImageBack.fileData,
                textTitle:
                    LocaleKeys.update_information_kyc_backIdentityCard.tr),
          ),
        ],
      ).paddingSymmetric(vertical: AppDimens.padding20),
      _itemPhotoCardLiveNess(
              onTap: () => controller.routeLiveNess(),
              urlImage: controller.filesImageLiveNess.fileData,
              textTitle: LocaleKeys.update_information_kyc_takePortraitPhoto.tr)
          .paddingOnly(bottom: AppDimens.padding20),
    ],
  );
}

Widget _itemPhotoCardLiveNess({
  required VoidCallback onTap,
  required Rx<Uint8List?> urlImage,
  required String textTitle,
}) {
  return Obx(
    () => GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: DottedBorder(
        color: urlImage.value != null
            ? AppColors.primaryBlue1
            : AppColors.basicGrey1,
        strokeWidth: /*urlImage.value != null
            ? AppDimens.sizeWeight3
            : */AppDimens.sizeWeight1,
        borderType: BorderType.RRect,
        radius: const Radius.circular(AppDimens.radius8),
        dashPattern: AppDimens.dashPattern,
        padding: EdgeInsets.zero,
        child: SizedBox(
          width: urlImage.value != null ? Get.width / 2 : Get.width,
          height: urlImage.value != null ? Get.height / 3 : AppDimens.height100,
          child: urlImage.value != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(AppDimens.radius8),
                  child: Image.memory(
                    urlImage.value!,
                    fit: BoxFit.fill,
                    // fit: BoxFit.cover,
                  ).paddingAll(AppDimens.padding1),
                )
              : _titleTakePicture(textTitle)
                  .paddingSymmetric(horizontal: AppDimens.padding2),
        ),
      ),
    ),
  );
}

Widget _itemPhotoCard({
  required VoidCallback onTap,
  required Rx<Uint8List?> urlImage,
  required String textTitle,
}) {
  return Obx(
    () => GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: DottedBorder(
        color: urlImage.value != null
            ? AppColors.primaryBlue1
            : AppColors.basicGrey1,
        strokeWidth: /*urlImage.value != null
            ? AppDimens.sizeWeight3
            : */AppDimens.sizeWeight1,
        borderType: BorderType.RRect,
        radius: const Radius.circular(AppDimens.radius8),
        dashPattern: AppDimens.dashPattern,
        padding: EdgeInsets.zero,
        child: SizedBox(
          width: Get.width,
          height: AppDimens.height100,
          child: urlImage.value != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(AppDimens.radius8),
                  child: Image.memory(
                    urlImage.value!,
                    fit: BoxFit.cover,
                    // fit: BoxFit.cover,
                  ).paddingAll(AppDimens.padding1),
                )
              : _titleTakePicture(textTitle)
                  .paddingSymmetric(horizontal: AppDimens.padding2),
        ),
      ),
    ),
  );
}

Column _titleTakePicture(String textTitle) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      TextUtils(
        text: textTitle,
        availableStyle: StyleEnum.bodyRegular,
        color: AppColors.basicGrey1,
        maxLine: 2,
        textAlign: TextAlign.center,
      ),
      sdsSB5,
      SvgPicture.asset(
        Assets.ASSETS_SVG_ICON_ADD_ITEM_SVG,
      ),
    ],
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
              text: LocaleKeys.update_information_kyc_Step1.tr,
              availableStyle: StyleEnum.bodyRegular,
              color: AppColors.basicBlack,
              maxLine: 4,
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
              availableStyle: StyleEnum.bodyRegular,
              color: AppColors.basicBlack,
            ),
          ),
          Expanded(
            child: TextUtils(
              text: LocaleKeys.update_information_kyc_Step2.tr,
              availableStyle: StyleEnum.bodyRegular,
              color: AppColors.basicBlack,
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
              availableStyle: StyleEnum.bodyRegular,
              color: AppColors.basicBlack,
            ),
          ),
          Expanded(
            child: TextUtils(
              text: LocaleKeys.update_information_kyc_Step3.tr,
              availableStyle: StyleEnum.bodyRegular,
              color: AppColors.basicBlack,
              maxLine: 1,
            ),
          ),
        ],
      ),
    ],
  ).paddingOnly(bottom: AppDimens.padding5);
}

Widget _buildButtonContinue(UpdateInformationController controller,
    {Function? function, String? titleButton}) {
  return SizedBox(
    height: AppDimens.iconHeightButton,
    child: Obx(
      () => ButtonUtils.buildButton(
        LocaleKeys.update_information_kyc_continue.tr,
        function?.call() ??
            () async =>
                controller.maybeContinue.value ? controller.getORC() : () {},
        isLoading: controller.isShowLoading.value,
        backgroundColor: controller.maybeContinue.value
            ? AppColors.primaryBlue1
            : AppColors.basicGrey3,
        borderRadius: BorderRadius.circular(AppDimens.radius4),
        colorText: controller.maybeContinue.value
            ? AppColors.basicWhite
            : AppColors.basicGrey1,
      ),
    ),
  );
}
