import 'package:authentication_kyc/assets.dart';
import 'package:authentication_kyc/shares/shares.src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/core.src.dart';

class SDSInputText extends StatefulWidget {
  final SDSInputTextModel inputTextFormModel;

  const SDSInputText(this.inputTextFormModel, {Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SDSInputTextState createState() => _SDSInputTextState();
}

class _SDSInputTextState extends State<SDSInputText> with FormatterEnum {
  final RxBool _isShowButtonClear = false.obs;
  final RxBool _showPassword = false.obs;

  @override
  void initState() {
    widget.inputTextFormModel.controller.addListener(() {
      if (widget.inputTextFormModel.controller.text.isNotEmpty) {
        _isShowButtonClear.value = true;
      }
    });
    _showPassword.value = widget.inputTextFormModel.obscureText;
    super.initState();
  }

  Widget? _suffixIcon() {
    if (widget.inputTextFormModel.suffixIcon != null) {
      return widget.inputTextFormModel.suffixIcon;
    }
    if (!_isShowButtonClear.value || widget.inputTextFormModel.isReadOnly) {
      return null;
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Visibility(
          visible: widget.inputTextFormModel.obscureText,
          child: InkWell(
            onTap: () {
              _showPassword.toggle();
            },
            child: Padding(
                padding: const EdgeInsets.all(
                  AppDimens.paddingDefault,
                ),
                child: SvgPicture.asset(_showPassword.value
                    ? Assets.ASSETS_SVG_ICON_HIDDEN_EYE_SVG
                    : Assets.ASSETS_SVG_ICON_APPEAR_EYE_SVG,
                  colorFilter: ColorFilter.mode(
                      widget.inputTextFormModel.suffixColor ??
                          AppColors.basicGrey1,
                      BlendMode.srcIn)),
                /*Icon(
                _showPassword.value
                    ? Icons.visibility_off_outlined
                    : Icons.remove_red_eye_outlined,
                color: widget.inputTextFormModel.suffixColor ??
                    AppColors.basicGrey1,
              )*/
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            widget.inputTextFormModel.controller.clear();
            widget.inputTextFormModel.onChanged?.call('');
            _isShowButtonClear.value = false;
          },
          child: Padding(
            padding: const EdgeInsets.only(
              right: AppDimens.paddingDefault,
            ),
            child: Icon(
              Icons.clear,
              color:
              widget.inputTextFormModel.suffixColor ?? AppColors.basicGrey1,
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    InputBorder? border = widget.inputTextFormModel.border ??
        const UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.basicGrey4),
        );
    return Obx(
          () =>
          Padding(
            padding: widget.inputTextFormModel.paddingModel ??
                const EdgeInsets.symmetric(
                  horizontal: AppDimens.paddingDefault,
                ),
            child: TextFormField(
              maxLines: widget.inputTextFormModel.maxLines,
              inputFormatters: getFormatters(widget.inputTextFormModel),
              validator: widget.inputTextFormModel.validator,
              autovalidateMode: widget.inputTextFormModel.autovalidateMode ??
                  (widget.inputTextFormModel.controller.text.isNullOrEmpty
                      ? AutovalidateMode.disabled
                      : AutovalidateMode.always),
              onChanged: (v) {
                if (!_isShowButtonClear.value || v.isEmpty) {
                  _isShowButtonClear.value = v.isNotEmpty;
                }
                widget.inputTextFormModel.onChanged?.call(v);
              },
              textInputAction: widget.inputTextFormModel
                  .iconNextTextInputAction,
              style: widget.inputTextFormModel.style ??
                  Get.textTheme.bodyLarge?.copyWith(
                      fontSize: widget.inputTextFormModel.textSize ??
                          AppDimens.fontSmall(),
                      color: widget.inputTextFormModel.textColor ??
                          Colors.black),
              controller: widget.inputTextFormModel.controller,
              obscureText: _showPassword.value,
              onTap: widget.inputTextFormModel.onTap,
              enabled: widget.inputTextFormModel.enable,
              autofocus: widget.inputTextFormModel.autoFocus,
              focusNode: widget.inputTextFormModel.focusNode,
              onTapOutside: widget.inputTextFormModel.onTapOutside,
              scrollPadding: const EdgeInsets.only(
                bottom: AppDimens.scrollPadding,
              ),
              keyboardType: widget.inputTextFormModel.textInputType,
              readOnly: widget.inputTextFormModel.isReadOnly,
              maxLength: widget.inputTextFormModel.maxLengthInputForm,
              textAlign: widget.inputTextFormModel.textAlign ?? TextAlign.left,
              onFieldSubmitted: (v) {
                if (widget.inputTextFormModel.submitFunc != null) {
                  widget.inputTextFormModel.submitFunc!.call(v);
                } else if (widget.inputTextFormModel.iconNextTextInputAction
                    .toString() ==
                    TextInputAction.next.toString()) {
                  FocusScope.of(context)
                      .requestFocus(widget.inputTextFormModel.nextNode);

                  widget.inputTextFormModel.onNext?.call(v);
                }
              },
              showCursor: widget.inputTextFormModel.showCursor,
              decoration: InputDecoration(
                counterText:
                widget.inputTextFormModel.isShowCounterText ? null : '',
                filled: widget.inputTextFormModel.filled,
                fillColor:
                widget.inputTextFormModel.fillColor ?? Colors.transparent,
                hoverColor:
                widget.inputTextFormModel.fillColor ?? Colors.transparent,
                hintStyle: TextStyle(
                  fontSize: widget.inputTextFormModel.hintTextSize ??
                      AppDimens.fontSmallest(),
                  color: widget.inputTextFormModel.hintTextColor ??
                      AppColors.basicGrey4,
                ),
                hintText: widget.inputTextFormModel.hintText?.tr,
                labelText: widget.inputTextFormModel.labelText?.tr,
                labelStyle: Get.textTheme.bodyMedium,
                errorStyle: TextStyle(
                  color: widget.inputTextFormModel.errorTextColor ??
                      AppColors.statusRed,
                ),
                prefixIcon: widget.inputTextFormModel.iconLeading != null
                    ? Icon(
                  widget.inputTextFormModel.iconLeading,
                  color: widget.inputTextFormModel.prefixIconColor ??
                      AppColors.basicGrey1,
                )
                    : null,
                prefixStyle: const TextStyle(
                    color: AppColors.basicGrey1,
                    backgroundColor: AppColors.basicGrey1),
                border: border,
                enabledBorder: border,
                focusedBorder: border,
                contentPadding: widget.inputTextFormModel.contentPadding ??
                    const EdgeInsets.only(
                      top: AppDimens.paddingDefault,
                      bottom: AppDimens.paddingDefault,
                    ),
                suffixIcon:
                widget.inputTextFormModel.showIconClear ? _suffixIcon() : null,
                helperText: widget.inputTextFormModel.helperText,
                helperStyle: widget.inputTextFormModel.helperStyle,
                helperMaxLines: widget.inputTextFormModel.helperMaxLines,
              ),
              onEditingComplete: widget.inputTextFormModel.onEditingComplete,
            ),
          ),
    );
  }
}
