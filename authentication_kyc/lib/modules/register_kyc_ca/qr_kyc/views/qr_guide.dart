import 'package:authentication_kyc/assets.dart';
import 'package:authentication_kyc/base_app/base_app.src.dart';
import 'package:authentication_kyc/core/core.src.dart';
import 'package:authentication_kyc/modules/register_kyc_ca/qr_kyc/controllers/qr_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../shares/shares.src.dart';

class QRGuidePage extends BaseGetWidget<QRController> {
  const QRGuidePage({Key? key}) : super(key: key);

  @override
  QRController get controller => Get.put(QRController());

  // @override
  // Widget buildWidgets() {
  //   return _buildBody();
  // }

  Widget _buildBody() {
    return Scaffold(
      backgroundColor: AppColors.basicWhite,
      body: Stack(
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                MobileScanner(
                  // fit: BoxFit.contain,
                  controller: controller.cameraController,
                  onDetect: (capture) {
                    final List<Barcode> barcodes = capture.barcodes;
                    // final Uint8List? image = capture.image;
                    for (final barcode in barcodes) {
                      if (barcode.rawValue != null) {
                        controller.getData(barcode.rawValue ?? "");
                      }
                    }
                  },
                  onScannerStarted: (_) {
                    controller.cameraController
                        .setZoomScale(controller.zoomX.value * 0.1);
                  },
                ),
                CustomPaint(
                  painter: CustomShapePainterDaily(),
                ),
                _buildListGuild(),
                _buildListImage(controller),
                Positioned(
                    top: Get.height / 3.8 - Get.height / 6,
                    left: 25,
                    child: Image.asset(
                      Assets.ASSETS_SVG_ICON_CORNER_LEFT_DOWN_PNG,
                      width: AppDimens.size45,
                      height: AppDimens.size45,
                      color: AppColors.basicWhite,
                    )),
                Positioned(
                    top: Get.height / 3.8 - Get.height / 6,
                    right: 25,
                    child: Image.asset(
                      Assets.ASSETS_SVG_ICON_CORNER_RIGHT_DOWN_PNG,
                      width: AppDimens.size45,
                      height: AppDimens.size45,
                      color: AppColors.basicWhite,
                    )),
                Positioned(
                    top: Get.height / 3.8 + Get.height / 6 - AppDimens.size45,
                    left: 25,
                    child: Image.asset(
                      Assets.ASSETS_SVG_ICON_CORNER_LEFT_UP_PNG,
                      width: AppDimens.size45,
                      height: AppDimens.size45,
                      color: AppColors.basicWhite,
                    )),
                Positioned(
                    top: Get.height / 3.8 + Get.height / 6 - AppDimens.size45,
                    right: 25,
                    child: Image.asset(
                      Assets.ASSETS_SVG_ICON_CORNER_RIGHT_UP_PNG,
                      width: AppDimens.size45,
                      height: AppDimens.size45,
                      color: AppColors.basicWhite,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListGuild() {
    return Positioned(
      left: 10,
      right: 10,
      top: Get.height / 3.8 + Get.height / 6 + 80,
      child: Column(
        children: [
          _buildItemText(
              "Do QR ở thẻ căn cước khá nhỏ, nên vui lòng làm theo hướng dẫn dưới đây"),
          const SizedBox(height: AppDimens.padding5),
          _buildItemText("Đặt QR vào trong ô camera ở trên"),
          const SizedBox(height: AppDimens.padding5),
          _buildItemText(
              "Di chuyển QR ra xa, lại gần camera hoặc dùng thanh zoom sao cho camera hiện rõ QR"),
          const SizedBox(height: AppDimens.padding5),
/*        _buildItemText(
            AppStr.text_item_qr_4),
        SizedBox(
          height: AppDimens.paddingVerySmall,
        ),*/
          _buildItemText(
              "Nếu chưa nhận biết được QR, vui lòng tắt flash đi rồi bật lại đến khi thành công"),
          sdsSB5,
        ],
      ).paddingSymmetric(horizontal: AppDimens.padding5),
    );
  }

  Widget _buildItemText(String title) {
    return Row(
      children: [
        const TextUtils(
            text: "•   ",
            color: AppColors.basicWhite,
            availableStyle: StyleEnum.subBold),
        Expanded(
          child: TextUtils(
              text: title,
              color: AppColors.basicWhite,
              availableStyle: StyleEnum.subBold),
        ),
      ],
    );
  }

  Widget _buildListImage(QRController controller) {
    return Positioned(
      left: 20,
      right: 20,
      top: Get.height / 3.8 + Get.height / 6 + 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: controller.cameraController.torchState,
                builder: (context, state, child) {
                  switch (state as TorchState) {
                    case TorchState.off:
                      return const Icon(Icons.flash_off,
                          color: AppColors.basicWhite);
                    case TorchState.on:
                      return const Icon(Icons.flash_on, color: Colors.yellow);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () async {
                controller.cameraController.toggleTorch();
                await Future.delayed(const Duration(milliseconds: 1500), () {
                  controller.cameraController.toggleTorch();
                });
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SliderTheme(
                data: SliderThemeData(
                  trackShape: CustomTrackShape(),
                ),
                child: SizedBox(
                  width: Get.width / 2.5,
                  child: Slider(
                    value: controller.zoomX.value,
                    max: 10,
                    divisions: 5,
                    label: "${controller.zoomX.value}X",
                    activeColor: AppColors.basicWhite,
                    inactiveColor: AppColors.colorDisable,
                    onChanged: (double value) {
                      controller.zoomX.value = value;
                      controller.cameraController.setZoomScale(value * 0.1);
                    },
                  ),
                ),
              ).paddingOnly(right: 10),
              TextUtils(
                text: "Zoom ${controller.zoomX.value}X",
                color: AppColors.basicWhite,
                availableStyle: StyleEnum.subBold,
                textAlign: TextAlign.left,
              )
            ],
          )
        ],
      ).paddingOnly(bottom: AppDimens.padding5),
    );
  }

  @override
  Widget buildWidgets(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        controller.onClose();
      },
      child: Obx(() => controller.isShowLoading.value
          ? Container(
              color: Colors.white,
              child: const Center(child: CupertinoActivityIndicator()))
          : _buildBody()),
    );
  }
}

class CustomShapePainterDaily extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Vẽ các khối màu vào canvas
    size = Get.size;
    Paint paint = Paint();
    final centerX = size.width / 2; // Tính toán tọa độ x của trung tâm
    final centerY = size.height / 3.8; // Tính toán tọa độ y của trung tâm
    final width = size.width - 50; // Chiều rộng của hình vuông
    final height = size.height / 3; // Chiều cao của hình vuông

    Path clipPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addRect(Rect.fromCenter(
          center: Offset(centerX, centerY), width: width, height: height));
    clipPath.fillType = PathFillType.evenOdd;

    canvas.clipPath(clipPath);

    // Vẽ các khối màu đã được cắt bỏ

    // Vẽ khối màu 1
    paint.color = AppColors.colorGreyOpacity35;
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

    // Vẽ viền đứt xung quanh hình vuông
    Path borderPath = Path();
    borderPath.addRect(
      Rect.fromCenter(
          center: Offset(centerX, centerY), width: width, height: height),
    );
    final borderPaint = Paint()
      ..color = Colors.amber // Màu của viền
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0; // Độ rộng của viền

    const dashWidth = 15.0; // Độ rộng của mỗi đoạn trong viền đứt
    const dashSpace = 10.0; // Khoảng cách giữa các đoạn trong viền đứt

    final path = Path();
    path.addRect(
      Rect.fromCenter(
          center: Offset(centerX, centerY), width: width, height: height),
    );

    // Vẽ viền đứt
    // drawDashedPath(canvas, path, borderPaint, dashWidth, dashSpace);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

/*  void drawDashedPath(Canvas canvas, Path path, Paint paint, double dashWidth,
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
  }*/
}
