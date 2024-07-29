import 'package:two_id_c06verify/core/core.src.dart';
import 'package:flutter/material.dart';

class CustomShapePainterLiveNess extends CustomPainter {
  int heightCenter;

  CustomShapePainterLiveNess({this.heightCenter = 30});

  @override
  void paint(Canvas canvas, Size size) {
    // Vẽ các khối màu vào canvas
    Paint paint = Paint();
    final centerX = size.width / 2; // Tính toán tọa độ x của trung tâm
    final centerY =
        size.height / 2 + heightCenter; // Tính toán tọa độ y của trung tâm
    final radiusX = size.width - 70; // Bán kính theo chiều ngang
    final radiusY = size.height / 1.6; // Bán kính theo chiều dọc

    Path clipPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addOval(Rect.fromCenter(
          center: Offset(centerX, centerY), width: radiusX, height: radiusY));
    clipPath.fillType = PathFillType.evenOdd;

    canvas.clipPath(clipPath);

    // Vẽ các khối màu đã được cắt bỏ

    // Vẽ khối màu 1
    paint.color = AppColors.colorBlack;
    canvas.drawRect(
        Rect.fromLTRB(0, 0, size.width * 0.5, size.height * 0.5), paint);

    // Vẽ khối màu 2
    // paint.color = Colors.white.withOpacity(0.5);
    canvas.drawRect(
        Rect.fromLTRB(size.width * 0.5, 0, size.width, size.height * 0.5),
        paint);

    // Vẽ khối màu 3
    // paint.color = Colors.white.withOpacity(0.5);
    canvas.drawRect(
        Rect.fromLTRB(0, size.height * 0.5, size.width * 0.5, size.height),
        paint);

    // Vẽ khối màu 4
    // paint.color = Colors.white.withOpacity(0.5);
    canvas.drawRect(
        Rect.fromLTRB(
            size.width * 0.5, size.height * 0.5, size.width, size.height),
        paint);

    // Vẽ viền đứt xung quanh hình ellipse
    Path borderPath = Path();
    borderPath.addOval(
      Rect.fromCenter(
          center: Offset(centerX, centerY), width: radiusX, height: radiusY),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  void drawDashedPath(Canvas canvas, Path path, Paint paint, double dashWidth,
      double dashSpace) {
    final metrics = path.computeMetrics();
    for (final metric in metrics) {
      double start = 0.0;
      while (start < metric.length) {
        final end = start + dashWidth;
        canvas.drawPath(
          metric.extractPath(start, end),
          paint,
        );
        start = end + dashSpace;
      }
    }
  }
}
