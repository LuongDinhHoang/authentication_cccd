import 'package:two_id_c06verify/core/core.src.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// VerySmall - [AppDimens.sizeTextSmaller] = 12
/// Small - [AppDimens.sizeTextSmall] = 14
/// Medium - [AppDimens.sizeTextMediumTb] = 16
/// Large - [AppDimens.sizeTextLarge] = 20
/// Large Supper - [AppDimens.sizeTextSupperLarge] = 24
///
/// normal - [FontWeight.normal] = w400
/// bold - [FontWeight.bold] = w700

// Có thể bổ sung
enum StyleEnum {
  /// VerySmall, normal
  detailRegular,

  /// VerySmall, bold
  detailBold,

  /// Small, normal
  bodyRegular,

  /// Small, bold
  bodyBold,

  /// Medium, bold
  subBold,

  /// Large, bold
  heading1Bold,

  /// Large Supper, bold
  heading2Bold,

}

class TextUtils extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  final double? wordSpacing;
  final StyleEnum? availableStyle;
  final int? maxLine;
  final TextAlign? textAlign;
  final TextStyle? customStyle;
  final FontStyle? fontStyle;
  final bool? isOverflow;
  final TextDecoration? textDecoration;
  final Color? colorDecoration;

  const TextUtils({
    Key? key,
    required this.text,
    this.size,
    this.fontWeight,
    this.color,
    this.wordSpacing,
    this.availableStyle,
    this.maxLine,
    this.textAlign,
    this.customStyle,
    this.fontStyle,
    this.isOverflow,
    this.textDecoration,
    this.colorDecoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style = GoogleFonts.nunitoSans().copyWith(
      fontSize: size ?? AppDimens.sizeTextMediumTb,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? AppColors.basicBlack,
      wordSpacing: wordSpacing,
      overflow: TextOverflow.ellipsis,
      fontStyle: fontStyle ?? FontStyle.normal,
      decoration: textDecoration ?? TextDecoration.none,
      decorationColor: colorDecoration ?? colorDecoration,
    );

    if (availableStyle != null) {
      switch (availableStyle!) {
        case StyleEnum.detailRegular:
          style = style.copyWith(
            fontSize: AppDimens.sizeTextSmaller,
            fontWeight: FontWeight.w400,
          );
          break;
        case StyleEnum.detailBold:
          style = style.copyWith(
            fontSize: AppDimens.sizeTextSmaller,
            fontWeight: FontWeight.bold,
          );
          break;
        case StyleEnum.bodyRegular:
          style = style.copyWith(
            fontSize: AppDimens.sizeTextSmall,
            fontWeight: FontWeight.w400,
          );
          break;
        case StyleEnum.bodyBold:
          style = style.copyWith(
            fontSize: AppDimens.sizeTextSmall,
            fontWeight: FontWeight.bold,
          );
          break;
        case StyleEnum.subBold:
          style = style.copyWith(
            fontSize: AppDimens.sizeTextMediumTb,
            fontWeight: FontWeight.bold,
          );
          break;
        case StyleEnum.heading1Bold:
          style = style.copyWith(
            fontSize: AppDimens.sizeTextLarge,
            fontWeight: FontWeight.bold,
          );
          break;
        case StyleEnum.heading2Bold:
          style = style.copyWith(
            fontSize: AppDimens.sizeTextSupperLarge,
            fontWeight: FontWeight.bold,
          );
          break;
      }
    }
    return Text(
      text,
      style: customStyle ?? style,
      maxLines: maxLine ?? 1,
      textAlign: textAlign,
      overflow: isOverflow ?? false ? TextOverflow.clip : null,
      softWrap: true,
    );
  }
}
