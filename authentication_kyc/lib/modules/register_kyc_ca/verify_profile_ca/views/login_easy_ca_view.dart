part of 'verify_profile_page.dart';

Widget _buildLoginCa(VerifyProfileController controller) {
  return SingleChildScrollView(
    child: Column(
      children: [
        TextUtils(
          text: LocaleKeys.verify_profile_titleLoginCa.tr,
          availableStyle: StyleEnum.bodyBold,
          color: AppColors.basicBlack,
          maxLine: 3,
        ),
        Obx(
          () => BaseFormLogin.buildFormLogin(
            formKey: controller.formKey,
            textUserName: controller.textUserName,
            textPassword: controller.textPassword,
            userNameFocus: controller.userNameFocus,
            passwordFocus: controller.passwordFocus,
            isLoading: controller.isShowLoading.value,
            fillColorUserName: controller.fillColorUserName,
            fillColorPassword: controller.fillColorPassword,
            isBiometric: controller.isRememberLogin.value,
            isForgotPassword: false,
            isShowLoading: controller.isShowLoading.value,
            functionLogin: () async {
              await controller.confirmLoginCa(controller);
            },
          ),
        )
      ],
    ).paddingSymmetric(horizontal: AppDimens.padding16),
  );
}
