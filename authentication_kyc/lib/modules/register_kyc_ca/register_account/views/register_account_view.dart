part of 'register_account_page.dart';

Widget _buildBody(RegisterAccountController controller) {
  return SingleChildScrollView(
    child: Form(
      key: controller.formKey,
      child: _buildForm(controller)
          .paddingSymmetric(horizontal: AppDimens.padding16),
    ),
  );
}

Widget _buildForm(RegisterAccountController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Visibility(
        visible: !controller.isVerifyProfile,
        child: _buildInformPackage(controller),
      ),
      TextUtils(
        text: controller.getTitle(),
        availableStyle: StyleEnum.subBold,
      ).paddingOnly(bottom: AppDimens.padding8),
      _buildInputData(
        title: LocaleKeys.register_account_number_cccd.tr,
        textEditingController: controller.textEditIdNumber,
        hintText: LocaleKeys.register_account_input_number_id.tr,
        currentNode: controller.idNumberFocus,
        nextMode: controller.numberPhoneFocus.value,
        textInputType: TextInputType.number,
        inputFormatters: InputFormatterEnum.identity,
        isEnable: controller.enableTextInput,
      ),
      _buildInputData(
        title: LocaleKeys.registerCa_numberPhone.tr,
        textEditingController: controller.textEditNumberPhone,
        hintText: LocaleKeys.register_account_input_number_phone.tr,
        currentNode: controller.numberPhoneFocus,
        nextMode: controller.emailFocus.value,
        inputFormatters: InputFormatterEnum.phoneNumber,
        textInputType: TextInputType.phone,
        isEnable: controller.enableTextInput,
      ),
      _buildInputData(
          title: LocaleKeys.register_account_email.tr,
          textEditingController: controller.textEditEmail,
          hintText: LocaleKeys.register_account_input_number_email.tr,
          currentNode: controller.emailFocus,
          isLoading: false,
          inputFormatters: InputFormatterEnum.email,
          textInputType: TextInputType.emailAddress,
          iconNextTextInputAction: TextInputAction.done,
          isEnable: controller.enableTextInput,
          onEditingComplete: () {
            KeyBoard.hide();
          }),
      const SizedBox(
        height: AppDimens.padding50,
      ),
    ],
  );
}

Widget _buildInformPackage(RegisterAccountController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextUtils(
        text: LocaleKeys.register_account_information_package.tr,
        availableStyle: StyleEnum.subBold,
      ).paddingOnly(bottom: AppDimens.padding8),
      _buildInputData(
        title: LocaleKeys.register_account_service_package.tr,
        textEditingController: controller.textEditService,
        hintText: "",
        currentNode: controller.serviceFocus,
        nextMode: controller.numberPhoneFocus.value,
        isEnable: controller.appController.userInfoModel.type ==
                AppConst.typeAgentAccount
            ? true
            : false,
        suffixIcon: controller.appController.userInfoModel.type ==
                AppConst.typeAgentAccount
            ? IconButton(
                color: AppColors.primaryBlue1,
                icon: const Icon(Icons.edit),
                onPressed: () {
                  Get.toNamed(AppRoutes.routeChoosePackage);
                },
              )
            : null,
      ),
    ],
  );
}

Widget _buildRegister(RegisterAccountController controller) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Visibility(
        visible: !controller.isVerifyProfile,
        child: UtilWidget.buildPermission(controller.isPermission),
      ),
      Obx(
        () => ButtonUtils.buildButton(
          LocaleKeys.registerCa_continue.tr,
          () async {
            if ((controller.formKey.currentState?.validate() ?? false)) {
              if (controller.isVerifyProfile) {
                await controller.createAccount();
              } else {
                if (controller.isPermission.value) {
                  await controller.getSessionUser();
                }
              }
            }
          },
          isLoading: controller.isShowLoading.value,
          backgroundColor: AppColors.primaryBlue1,
          borderRadius: BorderRadius.circular(AppDimens.radius4),
        ).paddingSymmetric(
            vertical: AppDimens.padding12, horizontal: AppDimens.padding16),
      ),
    ],
  );
}

Widget _buildInputData({
  required String title,
  required TextEditingController textEditingController,
  bool isLoading = false,
  required String hintText,
  int inputFormatters = 0,
  required Rx<FocusNode> currentNode,
  bool isEnable = true,
  FocusNode? nextMode,
  TextInputType textInputType = TextInputType.text,
  VoidCallback? onEditingComplete,
  TextInputAction iconNextTextInputAction = TextInputAction.next,
  Widget? suffixIcon,
}) {
  return Obx(
    () => SDSInputWithLabel(
      inputLabelModel: SDSInputLabelModel(
          label: title,
          paddingLabel: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 0,
          ),
          styleEnum: StyleEnum.detailRegular,
          colorTextLabel: AppColors.basicBlack,
          isValidate: true),
      inputTextFormModel: SDSInputTextModel(
        borderRadius: AppDimens.radius8,
        isShowCounterText: false,
        controller: textEditingController,
        isReadOnly: isLoading,
        hintTextSize: AppDimens.sizeTextSmall,
        hintTextColor: AppColors.basicGrey2,
        hintText: hintText,
        contentPadding: const EdgeInsets.only(
          top: AppDimens.paddingDefault,
          bottom: AppDimens.paddingDefault,
          left: AppDimens.paddingDefault,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.radius8),
          borderSide: const BorderSide(
            color: AppColors.primaryNavy,
          ),
        ),
        focusNode: currentNode.value,
        nextNode: nextMode,
        textInputType: textInputType,
        iconNextTextInputAction: iconNextTextInputAction,
        onEditingComplete: onEditingComplete,
        inputFormatters: inputFormatters,
        enable: isEnable,
        suffixIcon: suffixIcon,
        paddingModel: const EdgeInsets.symmetric(
          horizontal: 0,
        ),
      ),
    ),
  ).paddingOnly(bottom: AppDimens.padding12);
}
