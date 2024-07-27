import 'package:authentication_kyc/shares/shares.src.dart';
import 'package:flutter/cupertino.dart';

class FormInputInformationModel {
  String title;
  String hintText;
  TextEditingController textEditing;
  bool isEnable;
  int inputFormatters;
  TextInputAction iconNextTextInputAction;
  Rx<FocusNode>? focusNode;
  Rx<FocusNode>? nextFocus;
  TextInputType textInputType;
  VoidCallback? onEditingComplete;

  FormInputInformationModel({
    required this.title,
    required this.hintText,
    required this.textEditing,
    this.iconNextTextInputAction = TextInputAction.next,
    this.isEnable = true,
    this.inputFormatters = 0,
    this.focusNode,
    this.nextFocus,
    this.onEditingComplete,
    this.textInputType = TextInputType.text
  });
}
