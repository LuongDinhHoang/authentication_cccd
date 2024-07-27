part of 'register_service_ca_page.dart';

Widget _buildBody(RegisterServiceCaController controller) {
  // return PageView(
  //   physics: const NeverScrollableScrollPhysics(),
  //   controller: controller.pageViewController,
  //   onPageChanged: controller.handlePageViewChanged,
  //   children: [
  //     _buildOverviewOptions(controller),
  //     _buildSelectService(controller)
  //   ],
  // );
  return _buildOverviewOptions(controller);
}

Widget _buildOverviewOptions(RegisterServiceCaController controller) {
  return Column(
    children: [
      Center(
        child: SizedBox(
          height: AppDimens.sizeImg,
          width: AppDimens.sizeImg,
          child: SvgPicture.asset(Assets.ASSETS_SVG_ICON_SERVICE_CA_SVG),
        ),
      ).paddingSymmetric(vertical: AppDimens.paddingTop),
      _buildItemService(
        title: LocaleKeys.registerCa_titleRegisterService.tr,
        content: LocaleKeys.registerCa_contentRegisterService.tr,
        onTap: () {
          // controller.pageViewController.animateToPage(1,
          //     duration: const Duration(milliseconds: 500), curve: Curves.ease);
          Get.toNamed(AppRoutes.routeRegisterAccount, arguments: controller.isCreateAcc);
        },
      ),
      const SizedBox(
        height: AppDimens.paddingDefaultHeight,
      ),
      _buildItemService(
        title: LocaleKeys.registerCa_titleAccuracy.tr,
        content: LocaleKeys.registerCa_contentAccuracy.tr,
        onTap: () {
          controller.handleAvailability();
        },
      ),
    ],
  );
}

Widget _buildItemService({
  required String title,
  required String content,
  required VoidCallback onTap,
}) {
  return Container(
    width: Get.width,
    decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryNavy),
        borderRadius: BorderRadius.circular(AppDimens.minRadius)),
    child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
            left: AppDimens.padding12,
            top: AppDimens.padding10,
            bottom: AppDimens.paddingDefault),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  text: title,
                  availableStyle: StyleEnum.subBold,
                  color: AppColors.primaryNavy,
                ),
                TextUtils(
                  text: content,
                  availableStyle: StyleEnum.detailRegular,
                  color: AppColors.primaryNavy,
                ),
              ],
            ),
            SvgPicture.asset(Assets.ASSETS_SVG_ICON_DIRECTION_SVG)
                .paddingOnly(right: AppDimens.padding12)
          ],
        ),
      ),
    ),
  ).paddingSymmetric(horizontal: AppDimens.padding16);
}
