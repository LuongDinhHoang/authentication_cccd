import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:two_id_c06verify/assets.dart';
import 'package:two_id_c06verify/base_app/base_app.src.dart';
import 'package:two_id_c06verify/core/core.src.dart';
import 'package:two_id_c06verify/generated/locales.g.dart';
import 'package:two_id_c06verify/modules/register_kyc_ca/qr_kyc/controllers/qr_controller.dart';
import 'package:two_id_c06verify/shares/widgets/form/base_form_login.dart';

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
                    // for (final barcode in barcodes) {
                      if (barcodes.first.rawValue != null) {
                        controller.getData(barcodes.first.rawValue ?? "");
                      }
                    // }
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
                    top: Get.height / 4.2 - Get.height / 6 - 3,
                    left: 40 - 2,
                    child: Image.asset(
                      Assets.ASSETS_SVG_ICON_CORNER_LEFT_DOWN_PNG,
                      width: AppDimens.size45,
                      height: AppDimens.size45,
                      color: AppColors.primaryNavy,
                    )),
                Positioned(
                    top: Get.height / 4.2 - Get.height / 6 - 3,
                    right: 40 - 3,
                    child: Image.asset(
                      Assets.ASSETS_SVG_ICON_CORNER_RIGHT_DOWN_PNG,
                      width: AppDimens.size45,
                      height: AppDimens.size45,
                      color: AppColors.primaryNavy,
                    )),
                Positioned(
                    top: Get.height / 4.2 +
                        Get.height / 6 -
                        AppDimens.size45 +
                        2,
                    left: 40 - 2,
                    child: Image.asset(
                      Assets.ASSETS_SVG_ICON_CORNER_LEFT_UP_PNG,
                      width: AppDimens.size45,
                      height: AppDimens.size45,
                      color: AppColors.primaryNavy,
                    )),
                Positioned(
                    top: Get.height / 4.2 +
                        Get.height / 6 -
                        AppDimens.size45 +
                        3,
                    right: 40 - 3,
                    child: Image.asset(
                      Assets.ASSETS_SVG_ICON_CORNER_RIGHT_UP_PNG,
                      width: AppDimens.size45,
                      height: AppDimens.size45,
                      color: AppColors.primaryNavy,
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
      left: 37,
      right: 37,
      top: Get.height / 3.8 + Get.height / 6 + 120,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextUtils(
            text: "Hướng dẫn:",
            color: AppColors.colorDisable,
            availableStyle: StyleEnum.subBold,
            maxLine: 3,
          ),
          TextUtils(
            text: "Bước 1: Đặt mã QR trên thẻ CCCD vào vị trí khung",
            color: AppColors.colorDisable,
            availableStyle: StyleEnum.bodyRegular,
            maxLine: 3,
          ),
          sdsSB5,
          TextUtils(
            text:
                "Bước 2: Chờ hệ thống định danh và xác thực cho tới khi có thông báo thành công.",
            color: AppColors.colorDisable,
            availableStyle: StyleEnum.bodyRegular,
            maxLine: 3,
          ),
        ],
      ).paddingSymmetric(horizontal: AppDimens.padding5),
    );
  }

  Widget _buildListImage(QRController controller) {
    return Positioned(
      left: 20,
      right: 20,
      top: Get.height / 3.8 + Get.height / 6 + 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // IconButton(
          //     color: Colors.white,
          //     icon: ValueListenableBuilder(
          //       valueListenable: controller.cameraController.torchState,
          //       builder: (context, state, child) {
          //         switch (state as TorchState) {
          //           case TorchState.off:
          //             return const Icon(Icons.flash_off,
          //                 color: AppColors.basicWhite);
          //           case TorchState.on:
          //             return const Icon(Icons.flash_on, color: Colors.yellow);
          //         }
          //       },
          //     ),
          //     iconSize: 32.0,
          //     onPressed: () async {
          //       controller.cameraController.toggleTorch();
          //       await Future.delayed(const Duration(milliseconds: 1500), () {
          //         controller.cameraController.toggleTorch();
          //       });
          //     }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                    activeColor: AppColors.colorBlack,
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
                color: AppColors.colorBlack,
                availableStyle: StyleEnum.subBold,
                textAlign: TextAlign.left,
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // _itemSelect("Tải ảnh lên", () async {
              //   await controller.getQrToImage();
              // }),
              _itemSelect("Nhập số CCCD", () {
                Get.bottomSheet(SDSBottomSheet(
                  title: "",
                  body: Column(
                    children: [
                      Form(
                        key: controller.formKey,
                        child: BaseFormLogin.buildInputData(
                            title: "Số CCCD",
                            textEditingController:
                                controller.idDocumentController,
                            isLoading: false,
                            hintText: "Nhập số CCCD",
                            textInputType: TextInputType.number,
                            currentNode: controller.idDocumentFocus,
                            errorValidator: LocaleKeys
                                .register_account_errorValidatorCCCD.tr,
                            onValidator: (text) => UtilWidget.validateId(text),
                            fillColor: AppColors.basicWhite.obs,
                            autoFocus: true,
                            onEditingComplete: () {
                              controller.getDataToEnter(
                                  controller.idDocumentController.text);
                            }),
                      ),
                      ButtonUtils.buildButton(
                        LocaleKeys.registerCa_continue.tr,
                        () {
                          controller.getDataToEnter(
                              controller.idDocumentController.text);
                        },
                        // isLoading: isShowLoading,
                        // backgroundColor: AppColors.primaryCam1,
                        borderRadius: BorderRadius.circular(AppDimens.radius8),
                      ).paddingAll(AppDimens.paddingDefault),
                    ],
                  ),
                  noHeader: true,
                )).then((value) => controller.idDocumentController.clear());
              }),
            ],
          ),
        ],
      ).paddingOnly(bottom: AppDimens.padding5),
    );
  }

  GestureDetector _itemSelect(String title, VoidCallback action) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: action,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          height: 30,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: AppColors.colorBlack, width: 1),
            color: AppColors.basicWhite,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3), // Màu bóng và độ mờ
                spreadRadius: 1, // Bán kính bóng
                blurRadius: 2, // Độ mờ
                offset: const Offset(0, 1), // Độ dịch chuyển của bóng
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                child: TextUtils(
                  text: title,
                  availableStyle: StyleEnum.bodyRegular,
                  color: AppColors.colorBlack,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget buildWidgets(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        controller.onClose();
      },
      child: Scaffold(
        appBar: BackgroundAppBar.buildAppBar(
          "Cung cấp thông tin Qr",
          isColorGradient: false,
          centerTitle: false,
          leading: true,
          backgroundColor: AppColors.colorTransparent,
        ),
        body: Obx(() => controller.isShowLoading.value
            ? Container(
                color: Colors.white,
                child: const Center(child: CupertinoActivityIndicator()))
            : _buildBody()),
      ),
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
    final centerY = size.height / 4.2; // Tính toán tọa độ y của trung tâm
    final width = size.width - 80; // Chiều rộng của hình vuông
    final height = size.height / 3; // Chiều cao của hình vuông

    Path clipPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addRect(Rect.fromCenter(
          center: Offset(centerX, centerY), width: width, height: height));
    clipPath.fillType = PathFillType.evenOdd;

    canvas.clipPath(clipPath);

    // Vẽ các khối màu đã được cắt bỏ

    // Vẽ khối màu 1
    paint.color = AppColors.basicGrey4;
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
    // final borderPaint = Paint()
    //   ..color = Colors.amber // Màu của viền
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 4.0; // Độ rộng của viền
    //
    // const dashWidth = 15.0; // Độ rộng của mỗi đoạn trong viền đứt
    // const dashSpace = 10.0; // Khoảng cách giữa các đoạn trong viền đứt

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
