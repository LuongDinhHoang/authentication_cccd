import 'package:two_id_c06verify/core/core.src.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class FontStyleUtils {
  static TextStyle fontStyleSans(
      {double fontSize = 16,
      FontWeight fontWeight = FontWeight.w400,
      Color color = AppColors.colorBlack}) {
    return GoogleFonts.nunitoSans().copyWith(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle fontStyle(
      {double fontSize = 16,
      FontWeight fontWeight = FontWeight.w400,
      Color color = AppColors.colorBlack}) {
    return GoogleFonts.greatVibes().copyWith(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
