part of 'provision_page.dart';

Widget _itemBody(ProvisionController controller) {
  return Column(
    children: [
      const Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
      ButtonUtils.buildButton(LocaleKeys.home_agree.tr, () async {
        Get.toNamed(AppRoutes.routeQrKyc);
      },
          isLoading: controller.isShowLoading.value,
          backgroundColor: AppColors.primaryBlue1,
          colorText: AppColors.basicWhite),
      sdsSB5,
    ],
  ).paddingAll(AppDimens.padding15);
}
