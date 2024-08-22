import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:two_id_c06verify/assets.dart';
import 'package:two_id_c06verify/core/core.src.dart';
import 'package:two_id_c06verify/core/theme/colors.dart';
import 'package:two_id_c06verify/core/values/dimens.dart';
import 'package:two_id_c06verify/generated/locales.g.dart';
import 'package:two_id_c06verify/shares/widgets/text/font_style.dart';

import '../../shares.src.dart';

class BaseFormLogin {
  static Widget buildFormLogin({
    required TextEditingController textUserName,
    required TextEditingController textPassword,
    required Rx<FocusNode> userNameFocus,
    required Rx<FocusNode> passwordFocus,
    required bool isLoading,
    FocusNode? nextMode,
    required Rx<Color> fillColorUserName,
    required Rx<Color> fillColorPassword,
    required bool isBiometric,
    required bool isShowLoading,
    required GlobalKey formKey,
    bool isForgotPassword = true,
    required Function() functionLogin,
    bool isFaceID = true,
    Function()? functionLoginBiometric,
    Function()? functionLoginOther,
    Function()? functionRegister,
    final IconData? iconLeading,
    final Color? prefixIconColor,
    final String? displayName,
  }) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Visibility(
            visible: !isBiometric,
            child: buildInputData(
              title: "" /*LocaleKeys.login_userTitle.tr*/,
              textEditingController: textUserName,
              isLoading: isLoading,
              hintText: LocaleKeys.login_userHint.tr,
              currentNode: userNameFocus,
              nextMode: nextMode,
              errorValidator: LocaleKeys.login_accountEmpty.tr,
              fillColor: fillColorUserName,
              isBiometric: isBiometric,
              iconLeading: IconButton(
                  padding: const EdgeInsets.all(0.0),
                  constraints: const BoxConstraints(),
                  onPressed: () {},
                  icon: SvgPicture.asset(Assets.ASSETS_SVG_ICON_USER_SVG)),
            ),
          ),
          isBiometric
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        TextUtils(
                          text: displayName ?? "",
                          availableStyle: StyleEnum.subBold,
                          color: AppColors.colorBlack,
                        ),
                        sdsSBWidth8,
                        GestureDetector(
                            onTap: functionLoginOther,
                            child: SvgPicture.asset(
                                Assets.ASSETS_SVG_ICON_OTHER_USER_SVG)),
                      ],
                    ),
                    TextUtils(
                      text: textUserName.text
                          .replaceRange(7, textUserName.text.length, "*" * 5),
                      availableStyle: StyleEnum.detailRegular,
                      color: AppColors.basicBlack,
                    ),
                  ],
                )
              : const SizedBox(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: buildInputData(
                  title: "" /*LocaleKeys.login_password.tr*/,
                  textEditingController: textPassword,
                  isLoading: isLoading,
                  hintText: LocaleKeys.login_passwordHint.tr,
                  currentNode: passwordFocus,
                  errorValidator: LocaleKeys.login_passwordEmpty.tr,
                  fillColor: fillColorPassword,
                  iconNextTextInputAction: TextInputAction.done,
                  isPassword: true,
                  onEditingComplete: functionLogin,
                  iconLeading: IconButton(
                      padding: const EdgeInsets.all(0.0),
                      constraints: const BoxConstraints(),
                      onPressed: () {},
                      icon: SvgPicture.asset(Assets.ASSETS_SVG_ICON_PASS_SVG)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: AppDimens.padding11,
                  left: AppDimens.padding11,
                ),
                child: SizedBox(
                  width: AppDimens.btnMediumTb,
                  height: AppDimens.btnMediumTb,
                  child: GestureDetector(
                    onTap: functionLoginBiometric ?? () {},
                    child: Image.asset(
                      isFaceID
                          ? Assets.ASSETS_JPG_ICON_FACEID_PNG
                          : Assets.ASSETS_JPG_ICON_FINGERPRINT_PNG,
                      fit: BoxFit.fill,
                      width: AppDimens.btnMediumTb,
                      height: AppDimens.btnMediumTb,
                      // color: AppColors.primaryCam1,
                    ),
                  ),
                ),
              )
            ],
          ),
          _buildOptional(
            isForgotPassword,
            functionRegister: functionRegister,
          ),
          Row(
            children: [
              Expanded(
                  child: _buildButtonLogin(isShowLoading,
                      function: functionLogin)),
              // Padding(
              //   padding: const EdgeInsets.symmetric(
              //       horizontal: AppDimens.paddingDefault),
              //   child: SizedBox(
              //     width: AppDimens.btnMedium,
              //     height: AppDimens.btnMedium,
              //     child: IconButton(
              //       onPressed: functionLoginBiometric ?? () {},
              //       icon: Image.asset(
              //         isFaceID
              //             ? Assets.ASSETS_JPG_ICON_FACEID_PNG
              //             : Assets.ASSETS_JPG_ICON_FINGERPRINT_PNG,
              //         fit: BoxFit.fill,
              //         width: AppDimens.btnMediumMax,
              //         height: AppDimens.btnMediumMax,
              //         // color: AppColors.primaryCam1,
              //       ),
              //     ),
              //   ),
              // )
            ],
          )
        ],
      ),
    );
  }

  static Widget buildInputData({
    required String title,
    required TextEditingController textEditingController,
    required bool isLoading,
    required String hintText,
    required String errorValidator,
    required Rx<FocusNode> currentNode,
    required Rx<Color> fillColor,
    bool isBiometric = false,
    FocusNode? nextMode,
    String? Function(String?)? onValidator,
    bool isPassword = false,
    bool autoFocus = false,
    TextInputType textInputType = TextInputType.text,
    int? maxLength,
    EdgeInsetsGeometry? paddingModel,
    VoidCallback? onEditingComplete,
    TextInputAction iconNextTextInputAction = TextInputAction.next,
    final Widget? iconLeading,
    final Color? prefixIconColor,
    isValidate = false,
  }) {
    return Obx(
      () => SDSInputWithLabel(
        inputLabelModel: SDSInputLabelModel(
          label: title,
          paddingLabel: paddingModel ??
              const EdgeInsets.symmetric(
                // horizontal: AppDimens.paddingDefault,
                vertical: AppDimens.padding4,
              ),
          isValidate: isValidate,
        ),
        inputTextFormModel: SDSInputTextModel(
          borderRadius: AppDimens.radius8,
          isShowCounterText: false,
          maxLengthInputForm: maxLength,
          validator: onValidator ??
              (value) => value.isNullOrEmpty ? errorValidator : null,
          controller: textEditingController,
          fillColor: fillColor.value,
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
          obscureText: isPassword,
          iconLeading: iconLeading,
          prefixIconColor: prefixIconColor,
          focusNode: currentNode.value,
          nextNode: nextMode,
          textInputType: textInputType,
          iconNextTextInputAction: iconNextTextInputAction,
          onEditingComplete: onEditingComplete,
          inputFormatters: 0,
          autoFocus: autoFocus,
          paddingModel:
              const EdgeInsets.symmetric(vertical: AppDimens.paddingDefault),
        ),
      ),
    ).paddingOnly(bottom: AppDimens.padding5);
  }

  static Widget _buildOptional(bool isForgotPassword,
      {Function()? functionRegister}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: functionRegister,
          behavior: HitTestBehavior.opaque,
          child: RichText(
            text: TextSpan(
              text: LocaleKeys.login_notUser.tr,
              style: FontStyleUtils.fontStyleSans(
                color: AppColors.colorDisable,
                fontSize: AppDimens.sizeTextSmaller,
                fontWeight: FontWeight.w400,
              ),
              children: [
                TextSpan(
                    text: LocaleKeys.login_RegisterNew.tr,
                    style: FontStyleUtils.fontStyleSans(
                      fontSize: AppDimens.sizeTextSmaller,
                      color: AppColors.primaryBlue1,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                    )),
              ],
            ),
          ),
        ),
        sdsSB5,
        TextButton(
          onPressed: () {},
          child: TextUtils(
            text: LocaleKeys.login_forgetPassword.tr,
            availableStyle: StyleEnum.bodyRegular,
            color: AppColors.primaryBlue1,
          ),
        ),
      ],
    ).paddingOnly(bottom: AppDimens.padding5);
  }

  static Widget _buildButtonLogin(bool isShowLoading,
      {required Function() function}) {
    return SizedBox(
      height: AppDimens.btnMediumMax,
      child: ButtonUtils.buildButton(
        LocaleKeys.login_login.tr,
        function,
        isLoading: isShowLoading,
        backgroundColor: AppColors.primaryBlue1,
        borderRadius: BorderRadius.circular(AppDimens.radius10),
      ),
    );
  }
}
