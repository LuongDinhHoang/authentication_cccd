import 'package:flutter/material.dart';

import '../../shares.src.dart';

class SDSInputTextModel {
  final IconData? iconLeading;

  String? hintText;

  TextEditingController controller;

  final FocusNode? focusNode;

  final FocusNode? nextNode;

  final bool obscureText;

  final double borderRadius;

  final TextInputAction iconNextTextInputAction;

  final ValueChanged<String>? submitFunc;

  final ValueChanged<String>? onNext;

  FormFieldValidator<String>? validator;

  /// 0 : LengthLimitingText. Giới hạn ký tự nhập(nếu có)
  ///
  /// 1 : digitsOnly. Chỉ nhập số
  ///
  /// 2 : TaxCode. Kiểu nhập là mã số thuế
  ///
  /// 3 : textOnly. Không cho nhập các ký tự đặc biệt. dấu cách
  ///
  /// 4 : currency. Nhập giá trị tiền
  ///
  /// 5 : negativeNumber. Cho phép nhập giá trị âm
  ///
  /// 6 : decimalNumber. Cho phép nhập giá trị thập phân
  ///
  /// 7 : identity. Cho phép nhập giá trị căn cước
  ///
  /// 8 : phoneNumber. cho phép nhập giá trị là số điện thoại
  ///
  /// 9 : email. cho phép nhập giá trị là email
  ///
  /// 10: password. phép nhập ký tự đặc biệt không bao gồm dấu cách
  final int inputFormatters;

  final TextInputType textInputType;

  /// The [lengthLimit] must be null, -1 or greater than zero. If it is null or -1
  /// then no limit is enforced.
  final int? maxLengthInputForm;

  final bool isReadOnly;

  final bool autoFocus;

  final Color? fillColor;

  final Color? textColor;

  final Color? hintTextColor;

  double? hintTextSize;

  final double? textSize;

  final Color? prefixIconColor;

  final Color? errorTextColor;

  final Color? suffixColor;

  final ValueChanged<String>? onChanged;

  final int? maxLines;

  Widget? suffixIcon;

  final TextAlign? textAlign;

  final bool isShowCounterText;

  final bool enable;

  final String? labelText;

  final VoidCallback? onTap;

  final VoidCallback? onEditingComplete;

  final EdgeInsetsGeometry? contentPadding;

  String? helperText;

  TextStyle? helperStyle;

  final int? helperMaxLines;

  final TextStyle? style;

  InputBorder? border;

  final bool showFocusedBorder;

  final bool filled;

  final bool? showCursor;

  final bool showIconClear;

  final TextStyle? labelStyle;

  EdgeInsetsGeometry? paddingModel;

  final TapRegionCallback? onTapOutside;

  final AutovalidateMode? autovalidateMode;

  SDSInputTextModel({
    this.iconLeading,
    this.hintText,
    required this.controller,
    this.focusNode,
    this.submitFunc,
    this.nextNode,
    this.obscureText = false,
    this.iconNextTextInputAction = TextInputAction.next,
    this.onNext,
    this.validator,
    this.inputFormatters = InputFormatterEnum.lengthLimitingText,
    this.borderRadius = 10.0,
    this.textInputType = TextInputType.text,
    this.maxLengthInputForm,
    this.isReadOnly = false,
    this.autoFocus = false,
    this.fillColor,
    this.textColor,
    this.hintTextColor,
    this.hintTextSize,
    this.textSize,
    this.prefixIconColor,
    this.errorTextColor,
    this.suffixColor,
    this.onChanged,
    this.maxLines = 1,
    this.suffixIcon,
    this.isShowCounterText = true,
    this.textAlign,
    this.enable = true,
    this.contentPadding,
    this.labelText,
    this.onTap,
    this.helperText,
    this.helperStyle,
    this.helperMaxLines,
    this.style,
    this.border,
    this.showFocusedBorder = true,
    this.filled = true,
    this.showCursor,
    this.showIconClear = true,
    this.labelStyle,
    this.paddingModel,
    this.onTapOutside,
    this.autovalidateMode,
    this.onEditingComplete
  });
}
