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
              SizedBox(
                height: Get.height * 0.15,
              ),
              SvgPicture.asset(Assets.ASSETS_SVG_ICON_KYC_SVG)
                  .paddingOnly(bottom: 30),
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
                  isRemember: controller.isRemember,
                  isShowLoading: controller.isShowLoading.value,
                  functionLogin: () async {
                    await controller.confirmLogin();
                  },
                  functionLoginBiometric: () async {
                    await controller.loginFingerprint();
                  },
                  isFaceID:controller.biometricTypes.contains(BiometricType.face),
                ),
              ),
              TextButton(
                onPressed: () async {
                  controller.checkPermissionApp();
                  // Get.toNamed(AppRoutes.routeVerifyProfile);
                },
                child: TextUtils(
                  text: LocaleKeys.login_titleAccuracy.tr,
                  availableStyle: StyleEnum.bodyRegular,
                  color: AppColors.primaryBlue1,
                  textDecoration: TextDecoration.underline,
                  colorDecoration: AppColors.primaryBlue1,
                ),
              ),

              // _buildTitleLogin(),
              // SizedBox(
              //   height: Get.height * 0.05,
              // ),
              // Container(
              //   decoration: const BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.vertical(
              //           top: Radius.circular(AppDimens.sizeBorderNavi))),
              //   child: Column(
              //     children: [
              //       _buildFormLogin(controller),
              //       SizedBox(
              //         height: Get.height / 5,
              //       ),
              //       Center(
              //         child: RichText(
              //           text: TextSpan(
              //             text: LoginSTr.developedBy,
              //             style: FontStyleUtils.fontStyleSans(
              //               color: AppColors.colorTitleAppbar,
              //               fontSize: AppDimens.paddingSmall,
              //               fontWeight: FontWeight.w400,
              //             ),
              //             children: [
              //               TextSpan(
              //                   text: LoginSTr.nameCompany,
              //                   style: FontStyleUtils.fontStyleSans(
              //                     fontSize: AppDimens.paddingSmall,
              //                     color: AppColors.colorsOrange,
              //                     fontWeight: FontWeight.w700,
              //                   )),
              //             ],
              //           ),
              //         ),
              //       ).paddingOnly(bottom: AppDimens.paddingSmaller),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ],
    ).paddingAll(AppDimens.padding15),
  );
}

Widget _buildDevelopBy() {
  return SizedBox(
    width: Get.width,
    height: 50,
    child: Align(
      alignment: Alignment.bottomCenter,
      child: RichText(
        text: TextSpan(
          text: LocaleKeys.login_developBy.tr,
          style: FontStyleUtils.fontStyleSans(
            color: AppColors.colorBlack,
            fontSize: AppDimens.sizeTextSmaller,
            fontWeight: FontWeight.w400,
          ),
          children: [
            TextSpan(
                text: LocaleKeys.login_softDreams.tr,
                style: FontStyleUtils.fontStyleSans(
                  fontSize: AppDimens.sizeTextSmaller,
                  color: AppColors.primaryBlue1,
                  fontWeight: FontWeight.w700,
                )),
          ],
        ),
      ),
    ),
  );
}

// Widget _buildOptional(LoginController controller) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       UtilWidget.buildCheckBox(
//         controller.isRemember,
//         LocaleKeys.login_rememberAccount.tr,
//         // styleTextBox: AppTextStyle.labelStyle(),
//       ),
//       TextButton(
//         onPressed: () {},
//         child: TextUtils(
//           text: LocaleKeys.login_forgetPassword.tr,
//           availableStyle: StyleEnum.bodyRegular,
//           color: AppColors.primaryBlue1,
//         ),
//       ),
//     ],
//   ).paddingOnly(bottom: 5);
// }

// Widget _buildButtonLogin(LoginController controller,
//     {Function? function, String? titleButton}) {
//   return SizedBox(
//     height: AppDimens.iconHeightButton,
//     child: Obx(
//       () => ButtonUtils.buildButton(
//         LocaleKeys.login_login.tr,
//         function?.call() ??
//             () async {
//               Get.toNamed(AppRoutes.routeRegisterCA);
//             },
//         isLoading: controller.isShowLoading.value,
//         backgroundColor: AppColors.primaryBlue1,
//         borderRadius: BorderRadius.circular(AppDimens.radius4),
//       ),
//     ),
//   );
// }

//
// Widget _buildTitleLogin() {
//   return Column(
//     // mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       SizedBox(
//         width: AppDimens.iconLoginWidth,
//         height: AppDimens.paddingSizeAppBar,
//         child: Image.asset(ImageAsset.imgLogoApp),
//       ),
//       UtilWidget.sizedBox5,
//       SizedBox(
//           width: AppDimens.iconLogoWidth,
//           height: AppDimens.iconLogoHeight,
//           child: Image.asset(ImageAsset.imgLogoNameApp)),
//     ],
//   );
// }
//
// Widget _buildFormLogin(LoginController controller) {
//   return SingleChildScrollView(
//     child: Column(
//       children: [
//         SizedBox(
//           height: Get.height * 0.03,
//         ),
//         Text(
//           LoginSTr.loginBtn,
//           style: FontStyleUtils.fontStyleSans(
//             fontSize: AppDimens.iconVerySmall,
//             fontWeight: FontWeight.w800,
//           ),
//         ),
//         SizedBox(
//           height: Get.height * 0.02,
//         ),
//         Form(
//           key: controller.formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildInputData(
//                 title: LoginSTr.taxCode,
//                 textEditingController: controller.textTaxCode,
//                 isLoading: controller.isShowLoading.value,
//                 hintText: LoginSTr.hintTextTaxCode,
//                 errorValidator: LoginSTr.taxCodeError,
//                 currentNode: controller.taxCodeFocus,
//                 nextMode: controller.userNameFocus,
//                 textInputType: TextInputType.number,
//                 maxLength: 14,
//                 isTaxCode: true,
//               ),
//               UtilWidget.sizedBox10,
//               _buildInputData(
//                 title: LoginSTr.userName,
//                 textEditingController: controller.userNameController,
//                 isLoading: controller.isShowLoading.value,
//                 hintText: LoginSTr.hintTextUserName,
//                 errorValidator: LoginSTr.errorLoginUser,
//                 currentNode: controller.userNameFocus,
//                 nextMode: controller.passwordFocus,
//               ),
//               UtilWidget.sizedBox10,
//               _buildInputData(
//                 title: LoginSTr.password,
//                 textEditingController: controller.passwordController,
//                 isLoading: controller.isShowLoading.value,
//                 hintText: LoginSTr.hintTextPassWord,
//                 errorValidator: LoginSTr.loginErrorLengthPass,
//                 isPassword: true,
//                 currentNode: controller.passwordFocus,
//                 iconNextTextInputAction: TextInputAction.done,
//                 onEditingComplete: controller.funcLogin,
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(
//           height: AppDimens.btnSmall,
//         ),
//         _buildButtonLogin(controller),
//         UtilWidget.sizedBox10,
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             // Text(
//             //   LoginSTr.forgotPassword,
//             //   style: FontStyleUtils.fontStyleSans(
//             //       color: AppColors.colorForgotPassword,
//             //       fontSize: AppDimens.sizeTextSmaller,
//             //       fontWeight: FontWeight.w400),
//             // ),
//             GestureDetector(
//               onTap: () async {
//                 // Get.dialog(UtilWidget().openLoadingDialog(), barrierDismissible: true);
//                 await UtilWidget.launchInBrowser(LoginSTr.phoneAdviceUrl)
//                     .then((value) {
//                   // if()
//                   // Get.back();
//                 });
//                 // await launchUrlString("tel://190056 653");
//               },
//               child: RichText(
//                 text: TextSpan(
//                   text: LoginSTr.signAdvice,
//                   style: FontStyleUtils.fontStyleSans(
//                     color: AppColors.colorTitleAppbar,
//                     fontSize: AppDimens.sizeTextSmaller,
//                     fontWeight: FontWeight.w400,
//                   ),
//                   children: [
//                     TextSpan(
//                         text: LoginSTr.phoneAdvice,
//                         style: FontStyleUtils.fontStyleSans(
//                           fontSize: AppDimens.sizeTextSmaller,
//                           color: AppColors.colorsOrange,
//                           fontWeight: FontWeight.w700,
//                         )),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ],
//     ).paddingSymmetric(horizontal: AppDimens.paddingHuge),
//   );
// }
//
// Widget _buildButtonLogin(LoginController controller,
//     {Function? function, String? titleButton}) {
//   return SizedBox(
//     height: AppDimens.iconHeightButton,
//     child: Obx(
//       () => UtilWidget.buildButton(
//         titleButton ?? LoginSTr.loginBtn,
//         function?.call() ?? () async => await controller.funcLogin(),
//         isLoading: controller.isShowLoading.value,
//         backgroundColor: AppColors.colorsOrange,
//         borderRadius: BorderRadius.circular(AppDimens.paddingMediumMax),
//       ),
//     ),
//   );
// }
//
// Widget _buildInputData({
//   required String title,
//   required TextEditingController textEditingController,
//   required bool isLoading,
//   required String hintText,
//   required String errorValidator,
//   required Rx<FocusNode> currentNode,
//   FocusNode? nextMode,
//   bool isPassword = false,
//   TextInputType textInputType = TextInputType.text,
//   int? maxLength,
//   VoidCallback? onEditingComplete,
//   TextInputAction iconNextTextInputAction = TextInputAction.next,
//   required Rx<Color> fillColor,
// }) {
//   return Obx(
//     () => SDSInputWithLabel(
//       inputLabelModel: SDSInputLabelModel(
//           label: title,
//           paddingLabel: const EdgeInsets.symmetric(
//             horizontal: AppDimens.paddingDefault,
//             vertical: AppDimens.paddingDefault,
//           )),
//       inputTextFormModel: SDSInputTextModel(
//         borderRadius: 8,
//         isShowCounterText: false,
//         maxLengthInputForm: maxLength,
//         validator: (value) => value.isNullOrEmpty ? errorValidator : null,
//         controller: textEditingController,
//         fillColor: fillColor.value,
//         isReadOnly: isLoading,
//         hintTextSize: AppDimens.sizeTextSmall,
//         hintTextColor: AppColors.basicGrey2,
//         hintText: hintText,
//         // showFocusedBorder: false,
//         contentPadding: const EdgeInsets.only(
//           top: AppDimens.paddingDefault,
//           bottom: AppDimens.paddingDefault,
//           left: AppDimens.paddingDefault,
//         ),
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: const BorderSide(
//               color: AppColors.primaryNavy,
//             )),
//         // colorBorder: AppColors.primaryNavy,
//         // floatingLabelStyle: AppTextStyle.labelStyle(
//         //   size: AppDimens.sizeTextLarge,
//         // ),
//         obscureText: isPassword,
//         focusNode: currentNode.value,
//         nextNode: nextMode,
//         textInputType: textInputType,
//         iconNextTextInputAction: iconNextTextInputAction,
//         onTap: onEditingComplete,
//         inputFormatters: 0,
//       ),
//     ),
//   ).paddingOnly(bottom: 5);
// }
