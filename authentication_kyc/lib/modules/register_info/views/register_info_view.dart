part of 'register_info_page.dart';

Widget _itemBody(RegisterInfoController controller) {
  return Column(
    children: [
      Expanded(
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                BaseFormLogin.buildInputData(
                  title: LocaleKeys.registerCa_numberPhone.tr,
                  textEditingController: controller.phoneNumberConfirm,
                  hintText: "",
                  currentNode: controller.phoneNumberFocus,
                  nextMode: controller.emailFocus.value,
                  errorValidator: LocaleKeys.login_passwordEmpty.tr,
                  onValidator: (text) => validatePass(text),
                  fillColor: AppColors.basicWhite.obs,
                  isLoading: false,
                  // textInputType: TextInputType.number,
                  // inputFormatters: InputFormatterEnum.identity,
                  // isEnable: controller.enableTextInput,
                ),
                BaseFormLogin.buildInputData(
                  title: LocaleKeys.registerCa_email.tr,
                  textEditingController: controller.emailConfirm,
                  hintText: "",
                  currentNode: controller.emailFocus,
                  nextMode: controller.userNameFocus.value,
                  errorValidator: LocaleKeys.login_passwordEmpty.tr,
                  onValidator: (text) => validatePass(text),
                  fillColor: AppColors.basicWhite.obs,
                  isLoading: false,
                  // inputFormatters: InputFormatterEnum.phoneNumber,
                  // textInputType: TextInputType.phone,
                  // isEnable: controller.enableTextInput,
                ),
                BaseFormLogin.buildInputData(
                  title: LocaleKeys.userInfo_userName.tr,
                  textEditingController: controller.userNameConfirm,
                  hintText: "",
                  currentNode: controller.userNameFocus,
                  isLoading: true,
                  // onValidator: (text) =>
                  //     validateRepass(text, controller.emailConfirm.text),
                  // inputFormatters: InputFormatterEnum.email,
                  // textInputType: TextInputType.emailAddress,
                  iconNextTextInputAction: TextInputAction.done,
                  // isEnable: controller.enableTextInput,
                  isPassword: false,
                  onEditingComplete: () {
                    KeyBoard.hide();
                  },
                  errorValidator: '',
                  fillColor: AppColors.basicWhite.obs,
                ),
                BaseFormLogin.buildInputData(
                  title: LocaleKeys.login_password.tr,
                  textEditingController: controller.password,
                  hintText: "",
                  currentNode: controller.passwordFocus,
                  isLoading: false,
                  // onValidator: (text) =>
                  //     validateRepass(text, controller.emailConfirm.text),
                  // inputFormatters: InputFormatterEnum.email,
                  // textInputType: TextInputType.emailAddress,
                  iconNextTextInputAction: TextInputAction.done,
                  // isEnable: controller.enableTextInput,
                  isPassword: true,
                  onEditingComplete: () {
                    KeyBoard.hide();
                  },
                  errorValidator: '',
                  fillColor: AppColors.basicWhite.obs,
                ),
                BaseFormLogin.buildInputData(
                  title: LocaleKeys.ChangePassword_passwordNewConfirm.tr,
                  textEditingController: controller.passwordConfirm,
                  hintText: "",
                  currentNode: controller.passwordConfirmFocus,
                  isLoading: true,
                  // onValidator: (text) =>
                  //     validateRepass(text, controller.emailConfirm.text),
                  // inputFormatters: InputFormatterEnum.email,
                  // textInputType: TextInputType.emailAddress,
                  iconNextTextInputAction: TextInputAction.done,
                  // isEnable: controller.enableTextInput,
                  isPassword: true,
                  onEditingComplete: () {
                    KeyBoard.hide();
                  },
                  errorValidator: '',
                  fillColor: AppColors.basicWhite.obs,
                ),
              ],
            ),
          ),
        ),
      ),
      // Obx(
      //   () => ButtonUtils.buildButton(LocaleKeys.nfc_buttonStart.tr, () async {
      //     await controller.changePass();
      //   },
      //           isLoading: controller.isShowLoading.value,
      //           backgroundColor: AppColors.primaryBlue1,
      //           borderRadius: BorderRadius.circular(AppDimens.radius4),
      //           colorText: AppColors.basicWhite)
      //       .paddingSymmetric(
      //     vertical: AppDimens.padding10,
      //   ),
      // )
    ],
  ).paddingAll(AppDimens.padding15);
}

// Widget _buildInputData({
//   required String title,
//   required TextEditingController textEditingController,
//   bool isLoading = false,
//   required String hintText,
//   required String errorValidator,
//   int inputFormatters = 0,
//   required Rx<FocusNode> currentNode,
//   bool isEnable = true,
//   FocusNode? nextMode,
//   TextInputType textInputType = TextInputType.text,
//   VoidCallback? onEditingComplete,
//   TextInputAction iconNextTextInputAction = TextInputAction.next,
//   Widget? suffixIcon,
//   bool isPassword = false,
// }) {
//   return Obx(
//     () => SDSInputWithLabel(
//       inputLabelModel: SDSInputLabelModel(
//           label: title,
//           paddingLabel: const EdgeInsets.symmetric(
//             horizontal: 0,
//             vertical: 0,
//           ),
//           styleEnum: StyleEnum.detailRegular,
//           colorTextLabel: AppColors.basicBlack,
//           isValidate: true),
//       inputTextFormModel: SDSInputTextModel(
//         borderRadius: AppDimens.radius8,
//         isShowCounterText: false,
//         controller: textEditingController,
//         isReadOnly: isLoading,
//         validator: (value) => value.isNullOrEmpty ? errorValidator : null,
//         hintTextSize: AppDimens.sizeTextSmall,
//         hintTextColor: AppColors.basicGrey2,
//         hintText: hintText,
//         contentPadding: const EdgeInsets.only(
//           top: AppDimens.paddingDefault,
//           bottom: AppDimens.paddingDefault,
//           left: AppDimens.paddingDefault,
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(AppDimens.radius8),
//           borderSide: const BorderSide(
//             color: AppColors.primaryNavy,
//           ),
//         ),
//         focusNode: currentNode.value,
//         nextNode: nextMode,
//         textInputType: textInputType,
//         iconNextTextInputAction: iconNextTextInputAction,
//         onEditingComplete: onEditingComplete,
//         inputFormatters: inputFormatters,
//         enable: isEnable,
//         suffixIcon: suffixIcon,
//         obscureText: isPassword,
//         paddingModel: const EdgeInsets.symmetric(
//           horizontal: 0,
//         ),
//       ),
//     ),
//   ).paddingOnly(bottom: AppDimens.padding12);
// }
