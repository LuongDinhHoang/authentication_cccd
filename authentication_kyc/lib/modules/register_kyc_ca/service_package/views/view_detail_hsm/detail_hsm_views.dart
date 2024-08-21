part of 'detail_hsm_page.dart';

Widget _buildBody(DetailHsmController controller) {
  return SingleChildScrollView(
    child: Column(
      children: List.generate(
        controller.listDetailHSM.length,
        (index) => Obx(
          () => ItemServiceView.buildItemSelectService(
              title: controller.nameServicePackage(controller.listDetailHSM[index].certType ?? "", controller.listDetailHSM[index].expiry ?? 1),
              colorBackground: controller.getColorBackgroundSelect(index),
              colorBorder: controller.getColorBorderSelect(index),
              price: controller.listDetailHSM[index].price,
              // isEnterprise: controller.appController.userInfoModel.type ==
              //     AppConst.typeAgentAccount,
              onTap: () {
                controller.indexHsm.value = index;
              }).paddingOnly(bottom: AppDimens.padding10),
        ),
      ),
    ).paddingSymmetric(horizontal: AppDimens.padding16),
  );
}

Widget _buildNavigationBar(DetailHsmController controller) {
  return Obx(
    () => ButtonUtils.buildButton(
      LocaleKeys.registerCa_continue.tr,
      () {
        controller.setDataPackageInfo();
      },
      backgroundColor: controller.getColorButton(),
      borderRadius: BorderRadius.circular(AppDimens.radius4),
      height: AppDimens.iconHeightButton,
    ).paddingSymmetric(
        horizontal: AppDimens.paddingDefaultHeight,
        vertical: AppDimens.padding10),
  );
}
