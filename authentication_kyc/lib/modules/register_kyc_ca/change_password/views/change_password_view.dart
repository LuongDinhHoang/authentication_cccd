part of 'change_password_page.dart';

Widget _itemBody(ChangePasswordController controller){
  return Column(
    children: [
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