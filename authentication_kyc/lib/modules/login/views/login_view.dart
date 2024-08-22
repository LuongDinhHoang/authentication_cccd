part of 'login_page.dart';

//
Widget _body(LoginController controller) {
  return SizedBox(
    height: Get.height,
    width: Get.width,
    child: Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(Assets
                      . /*ASSETS_SVG_ICON_LOCK_SVG*/ ASSETS_SVG_ICON_KYC_SMALL_SVG),
                  // Expanded(
                  //   child: Container(
                  //     alignment: Alignment.centerRight,
                  //     child: TextButton(
                  //       onPressed: () {},
                  //       style: TextButton.styleFrom(
                  //           padding: EdgeInsets.zero,
                  //           alignment: Alignment.centerLeft),
                  //       child: TextUtils(
                  //         text: LocaleKeys.login_clause.tr,
                  //         availableStyle: StyleEnum.bodyRegular,
                  //         color: AppColors.primaryBlue1,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ).paddingSymmetric(vertical: AppDimens.padding15),
              /*SvgPicture.asset(
                Assets.ASSETS_SVG_ICON_KYC_SVG,
                width: 136,
                height: 115,
              )*/
              /*SvgPicture.asset(
                Assets.ASSETS_SVG_ICON_KYC_SVG,
                width: 136,
                height: 115,
              )*/
              Image.asset(
                Assets.ASSETS_JPG_ICON_BANNER_LOGIN_PNG,
                fit: BoxFit.fill,
                width: Get.width - 50,
                height: Get.height / 3.5,
                // color: AppColors.primaryCam1,
              ).paddingSymmetric(vertical: AppDimens.padding30),
              // _buildInputData(
              //   title: LocaleKeys.login_userTitle.tr,
              //   textEditingController: controller.userNameController,
              //   isLoading: controller.isShowLoading.value,
              //   hintText: LocaleKeys.login_userHint.tr,
              //   // errorValidator: LoginSTr.errorLoginUser,
              //   currentNode: controller.userNameFocus,
              //   nextMode: controller.passwordFocus.value,
              //   errorValidator: '',
              //   fillColor: controller.fillColorUserName,
              // ),
              // _buildInputData(
              //   title: LocaleKeys.login_password.tr,
              //   textEditingController: controller.passwordController,
              //   isLoading: controller.isShowLoading.value,
              //   hintText: LocaleKeys.login_passwordHint.tr,
              //   // errorValidator: LoginSTr.errorLoginUser,
              //   currentNode: controller.passwordFocus,
              //   // nextMode: controller.passwordFocus,
              //   errorValidator: '',
              //   fillColor: controller.fillColorPassword,
              //   isPassword: true,
              // ),
              // _buildOptional(controller),
              // _buildButtonLogin(controller),
              Obx(
                () => BaseFormLogin.buildFormLogin(
                  formKey: controller.formKey,
                  textUserName: controller.userNameController,
                  textPassword: controller.passwordController,
                  userNameFocus: controller.userNameFocus,
                  passwordFocus: controller.passwordFocus,
                  isLoading: controller.isShowLoading.value,
                  fillColorUserName: controller.fillColorUserName,
                  fillColorPassword: controller.fillColorPassword,
                  isBiometric: controller.isBiometric.value,
                  displayName: controller.displayName,
                  isShowLoading: controller.isShowLoading.value,
                  functionLogin: () async {
                    await controller.confirmLogin();
                  },
                  functionLoginBiometric: () async {
                    await controller.loginFingerprint();
                  },
                  functionLoginOther: () {
                    controller.loginOther();
                  },
                  functionRegister: () {
                    controller.appController.typeAuthentication =
                        AppConst.typeRegister;
                    Get.toNamed(AppRoutes.routeProvision)?.then((value) {
                      controller.appController.clearData();
                    });
                  },
                  isFaceID:
                      controller.biometricTypes.contains(BiometricType.face),
                ),
              ),
              sdsSBHeight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _itemListFunction(
                      icon: Assets.ASSETS_SVG_ICON_AUTHENTICATION_SVG,
                      title: LocaleKeys.login_authentication.tr,
                      action: () {}),
                  _itemListFunction(
                      icon: Assets.ASSETS_SVG_ICON_LIST_USER_SVG,
                      title: LocaleKeys.login_listUser.tr,
                      action: () {}),
                  _itemListFunction(
                      icon: Assets.ASSETS_SVG_ICON_SERVICE_PACKAGE_SVG,
                      title: LocaleKeys.login_servicePackage.tr,
                      action: () {}),
                  _itemListFunction(
                    icon: Assets.ASSETS_SVG_ICON_SUPPORT_SVG,
                    title: LocaleKeys.login_support.tr,
                    action: () async => await UtilWidget.launchInBrowser(
                        LocaleKeys.check_nfc_number_hotline.tr),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    ).paddingAll(AppDimens.padding15),
  );
}

Widget _itemListFunction({
  required String icon,
  required String title,
  required VoidCallback action,
}) {
  return Expanded(
    flex: 1,
    child: GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: action,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.basicGrey3.withOpacity(0.1),
                    blurRadius: 2,
                    offset: const Offset(1, 2), // Shadow position
                  ),
                ],
              ),
              child: SvgPicture.asset(icon)),
          sdsSBHeight12,
          TextUtils(
            text: title,
            availableStyle: StyleEnum.detailRegular,
            maxLine: 3,
            textAlign: TextAlign.center,
          )
        ],
      ).paddingSymmetric(
        horizontal: AppDimens.padding5,
      ),
    ),
  );
}

Widget _buildDevelopBy() {
  return SizedBox(
    width: Get.width,
    height: 50,
    child: Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          TextUtils(
            text: LocaleKeys.login_id.tr,
            availableStyle: StyleEnum.bodyRegular,
            textAlign: TextAlign.center,
            color: AppColors.colorDisable,
          ),
        ],
      ),
    ),
  );
}
