import 'package:easy_ca/core/theme/colors.dart';
import 'package:easy_ca/core/values/dimens.dart';
import 'package:easy_ca/generated/locales.g.dart';
import 'package:flutter/material.dart';

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
    required RxBool isRemember,
    required bool isShowLoading,
    required GlobalKey formKey,
    bool isForgotPassword = true,
    required Function() functionLogin,
  }) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          _buildInputData(
            title: LocaleKeys.login_userTitle.tr,
            textEditingController: textUserName,
            isLoading: isLoading,
            hintText: LocaleKeys.login_userHint.tr,
            currentNode: userNameFocus,
            nextMode: nextMode,
            errorValidator: LocaleKeys.login_accountEmpty.tr,
            fillColor: fillColorUserName,
          ),
          _buildInputData(
            title: LocaleKeys.login_password.tr,
            textEditingController: textPassword,
            isLoading: isLoading,
            hintText: LocaleKeys.login_passwordHint.tr,
            currentNode: passwordFocus,
            errorValidator: LocaleKeys.login_passwordEmpty.tr,
            fillColor: fillColorPassword,
            iconNextTextInputAction: TextInputAction.done,
            isPassword: true,
            onEditingComplete: functionLogin,
          ),
          _buildOptional(isRemember, isForgotPassword),
          _buildButtonLogin(isShowLoading, function: functionLogin)
        ],
      ),
    );
  }

  static Widget _buildInputData({
    required String title,
    required TextEditingController textEditingController,
    required bool isLoading,
    required String hintText,
    required String errorValidator,
    required Rx<FocusNode> currentNode,
    required Rx<Color> fillColor,
    FocusNode? nextMode,
    bool isPassword = false,
    TextInputType textInputType = TextInputType.text,
    int? maxLength,
    VoidCallback? onEditingComplete,
    TextInputAction iconNextTextInputAction = TextInputAction.next,
  }) {
    return Obx(
      () => SDSInputWithLabel(
        inputLabelModel: SDSInputLabelModel(
            label: title,
            paddingLabel: const EdgeInsets.symmetric(
              horizontal: AppDimens.paddingDefault,
              vertical: AppDimens.paddingDefault,
            )),
        inputTextFormModel: SDSInputTextModel(
          borderRadius: AppDimens.radius8,
          isShowCounterText: false,
          maxLengthInputForm: maxLength,
          validator: (value) => value.isNullOrEmpty ? errorValidator : null,
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
          focusNode: currentNode.value,
          nextNode: nextMode,
          textInputType: textInputType,
          iconNextTextInputAction: iconNextTextInputAction,
          onEditingComplete: onEditingComplete,
          inputFormatters: 0,
        ),
      ),
    ).paddingOnly(bottom: AppDimens.padding5);
  }

  static Widget _buildOptional(RxBool isRemember, bool isForgotPassword) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        UtilWidget.buildCheckBox(
          isRemember,
          LocaleKeys.login_rememberAccount.tr,
// styleTextBox: AppTextStyle.labelStyle(),
        ),
        Visibility(
          visible: isForgotPassword,
          child: TextButton(
            onPressed: () {},
            child: TextUtils(
              text: LocaleKeys.login_forgetPassword.tr,
              availableStyle: StyleEnum.bodyRegular,
              color: AppColors.primaryCam1,
            ),
          ),
        ),
      ],
    ).paddingOnly(bottom: AppDimens.padding5);
  }

  static Widget _buildButtonLogin(bool isShowLoading,
      {required Function() function}) {
    return SizedBox(
      height: AppDimens.iconHeightButton,
      child: ButtonUtils.buildButton(
        LocaleKeys.login_login.tr,
        function,
        isLoading: isShowLoading,
        backgroundColor: AppColors.primaryCam1,
        borderRadius: BorderRadius.circular(AppDimens.radius4),
      ),
    );
  }
}
