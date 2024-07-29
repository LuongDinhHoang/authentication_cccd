import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:two_id_c06verify/base_app/base_app.src.dart';
import 'package:two_id_c06verify/modules/register_kyc_ca/update_photo_information_kyc/update_photo_information_kyc.src.dart';
import 'package:two_id_c06verify/shares/shares.src.dart';
import 'package:screenshot/screenshot.dart';

class TakePictureCardKycController extends BaseGetxController {
  ScreenshotController screenshotController = ScreenshotController();
  ScreenshotController screenshotControllerResult = ScreenshotController();

  late CameraController cameraController;
  final AppController appController = Get.find<AppController>();
  final UpdateInformationController updateInformationController =
  Get.find<UpdateInformationController>();
  final RxBool isFlashOn = false.obs;
  Rx<Uint8List?> imageTemp = Rx<Uint8List?>(null);
  Uint8List? imageResult;

  bool isTakeFront = false;

  @override
  Future<void> onInit() async {
    super.onInit();

    cameraController = appController.cameraController;
    isTakeFront = Get.arguments;
  }

  @override
  void onClose() {
    cameraController.setFlashMode(FlashMode.off);
    cameraController.resumePreview();
    super.onClose();
  }

  Future<void> toggleFlash() async {
    if (cameraController.value.flashMode == FlashMode.off) {
      await cameraController.setFlashMode(FlashMode.torch);
    } else {
      await cameraController.setFlashMode(FlashMode.off);
    }
    isFlashOn.value = cameraController.value.flashMode == FlashMode.torch;
  }

  Future<void> takePictureScreen() async {
    cameraController.pausePreview();
    showLoadingOverlay();
    // Get.dialog(ShowPopup().openLoadingDialog(), barrierDismissible: true);

    imageTemp.value = await screenshotController.capture(
      pixelRatio: 3,
      delay: 10.milliseconds,
    );
    hideLoadingOverlay();
  }
  void retakePicture(){
    cameraController.resumePreview();
    imageTemp.value = null;
  }

  Future<void> takePictureScreenResult() async {
    showLoadingOverlay();

    imageResult = await screenshotControllerResult.capture(
      pixelRatio: 3,
      delay: 10.milliseconds,
    );
    if (isTakeFront) {
      updateInformationController.filesImageFront.fileData.value =
          imageResult;
    } else {
      updateInformationController.filesImageBack.fileData.value =
          imageResult;
    }

    if (updateInformationController.filesImageFront.fileData.value !=
        null &&
        updateInformationController.filesImageBack.fileData.value !=
            null) {
      updateInformationController.startTimeOutKyc();
      List<FilesImageModel> listFile = [
        updateInformationController.filesImageFront,
        updateInformationController.filesImageBack,
      ];
      await updateInformationController.sendFile(
              listFile) /*.then((value) {
        if(value.success == EnumStatusResponse.success){

        }else{
          retakePicture();
          showSnackBar(value.message);
        }
      })*/;

    }
    hideLoadingOverlay();
    Get.back();
  }
}
