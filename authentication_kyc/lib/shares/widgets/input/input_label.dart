import 'package:flutter/material.dart';

import '../../../core/core.src.dart';
import '../../../generated/locales.g.dart';
import '../../shares.src.dart';

class SDSInputWithLabel extends StatelessWidget {
  final SDSInputTextModel inputTextFormModel;
  final SDSInputLabelModel inputLabelModel;

  const SDSInputWithLabel({
    Key? key,
    required this.inputLabelModel,
    required this.inputTextFormModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: inputLabelModel.label.isNotEmpty,
          child: Padding(
            padding: inputLabelModel.paddingLabel ??
                const EdgeInsets.symmetric(
                    vertical: AppDimens.paddingDefault),
            child: Row(
              children: [
                Flexible(
                  child: TextUtils(
                    text: inputLabelModel.label.tr,
                    availableStyle:
                        inputLabelModel.styleEnum ?? StyleEnum.bodyRegular,
                    color:
                        inputLabelModel.colorTextLabel ?? AppColors.primaryNavy,
                  ),
                ),
                TextUtils(
                  text: inputLabelModel.isValidate ? " *" : "",
                  color: AppColors.statusRed,
                  availableStyle: StyleEnum.bodyRegular,
                ),
                // AutoSizeText(
                //   inputLabelModel.isValidate ? " *" : "",
                //   style: Get.textTheme.bodyLarge?.copyWith(
                //     color: Colors.red,
                //   ),
                // ),
              ],
            ),
          ),
        ),
        SDSInputText(
          inputTextFormModel
            ..validator = inputTextFormModel.validator ??
                (val) {
                  if (inputLabelModel.isValidate) {
                    if (val!.isNullOrEmpty) {
                      return inputLabelModel.label.replaceAll(':', '').tr +
                          LocaleKeys.login_errorEmpty.tr;
                    }
                    // return null;
                  }
                  if (inputTextFormModel.inputFormatters ==
                          InputFormatterEnum.phoneNumber &&
                      !val.isNullOrEmpty &&
                      !isPhoneValidate(value: val)) {
                    return LocaleKeys.login_errorPhoneNumberType.tr;
                  }
                  if (inputTextFormModel.inputFormatters ==
                          InputFormatterEnum.email &&
                      !val.isNullOrEmpty &&
                      !isEmail(val)) {
                    return LocaleKeys.login_errorEmail.tr;
                  }
                  if (inputTextFormModel.inputFormatters ==
                          InputFormatterEnum.identity &&
                      !val.isNullOrEmpty &&
                      !isIdentityCard(value: val)) {
                    return LocaleKeys.login_errorIdentityCard.tr;
                  }
                  if (inputTextFormModel.inputFormatters ==
                          InputFormatterEnum.taxCode &&
                      !val.isNullOrEmpty &&
                      !isTaxCode(taxCode: val)) {
                    return LocaleKeys.login_errorTaxCodeCount.tr;
                  }
                  return null;
                },
        ),
      ],
    );
  }
}
