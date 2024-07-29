import 'package:two_id_c06verify/shares/shares.src.dart';
import 'package:flutter/material.dart';

class SDSInputLabelModel {
  final String label;

  final bool isValidate;

  final StyleEnum? styleEnum;

  final EdgeInsetsGeometry? paddingLabel;

  final double? padding;

  final Color? colorTextLabel;

  SDSInputLabelModel({
    required this.label,
    this.isValidate = false,
    this.styleEnum,
    this.paddingLabel,
    this.padding,
    this.colorTextLabel
  });
}
