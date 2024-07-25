part of 'choose_package_page.dart';

Widget _buildBody(ChoosePackageController controller) {
  if (controller.listPackage.isNotEmpty) {
    return _buildSelectService(controller);
  } else {
    return UtilWidget.buildEmptyList();
  }
}

Widget _buildSelectService(ChoosePackageController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextUtils(
        text: LocaleKeys.registerCa_stepService.tr,
        availableStyle: StyleEnum.subBold,
        color: AppColors.basicBlack,
      ),
      sdsSBDefault,
      ...List.generate(
        controller.listPackage.length,
        (index) => Obx(
          () => ItemServiceView.buildItemSelectService(
              title: controller.listPackage[index].title,
              colorBackground: controller.getColorBackgroundSelect(index),
              colorBorder: controller.getColorBorderSelect(index),
              onTap: () {
                controller.indexServiceCa.value = index;
              }).paddingOnly(bottom: AppDimens.padding10),
        ),
      ),
    ],
  ).paddingOnly(
      left: AppDimens.padding16,
      top: AppDimens.paddingTop,
      right: AppDimens.padding16);
}

Widget _buildPolicyPrivacy(ChoosePackageController controller) {
  return Obx(
    () => ButtonUtils.buildButton(
      LocaleKeys.registerCa_continue.tr,
      () {
        if (controller.indexServiceCa.value != -1) {
          Get.toNamed(AppRoutes.routeDetailHsm,
              arguments: controller
                  .listPackage[controller.indexServiceCa.value].listPackage);
        }
      },
      isLoading: controller.isShowLoading.value,
      backgroundColor: controller.getColorButton(),
      borderRadius: BorderRadius.circular(AppDimens.radius4),
      height: AppDimens.iconHeightButton,
    ).paddingSymmetric(
        horizontal: AppDimens.paddingDefaultHeight,
        vertical: AppDimens.padding12),
  );
}
