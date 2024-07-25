import 'package:easy_ca/core/core.src.dart';
import 'package:flutter/material.dart';

import '../../../../shares/shares.src.dart';

class CustomShapePainterTakePicture extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    size = Get.size;
    Paint paint = Paint();
    final centerX = size.width / 2; // Tính toán tọa độ x của trung tâm
    final centerY = size.height / 2; // Tính toán tọa độ y của trung tâm
    final width = size.width - AppDimens.padding80; // Chiều rộng của hình vuông
    final height = size.height / 1.5; // Chiều cao của hình vuông
    const borderRadius = AppDimens.radius20; // Bán kính border radius

    Path holePath = Path()
      ..addRRect(RRect.fromRectAndRadius(
          Rect.fromCenter(
              center: Offset(centerX, centerY), width: width, height: height),
          const Radius.circular(borderRadius)));

    Path outerRectPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    Path combinedPath =
    Path.combine(PathOperation.difference, outerRectPath, holePath);

    paint.color = AppColors.colorGreyOpacity35;
    canvas.drawPath(combinedPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
