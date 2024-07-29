import 'dart:typed_data';

import 'package:two_id_c06verify/base_app/base_app.src.dart';
import 'package:two_id_c06verify/core/base/base.src.dart';
import 'package:two_id_c06verify/core/core.src.dart';
import 'package:two_id_c06verify/generated/locales.g.dart';
import 'package:two_id_c06verify/modules/register_kyc_ca/live_ness/live_ness_kyc.src.dart';
import 'package:two_id_c06verify/modules/register_kyc_ca/update_photo_information_kyc/update_photo_information_kyc.src.dart';
import 'package:two_id_c06verify/modules/register_kyc_ca/verify_profile_ca/models/authen_profile_model/auth_profile_model.src.dart';
import 'package:two_id_c06verify/shares/shares.src.dart';
import 'package:flutter/painting.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:permission_handler/permission_handler.dart';

class UpdateInformationController extends BaseGetxController {
  RxBool maybeContinue = false.obs;

  // Rx<Uint8List?> imagePhotoFront = Rx<Uint8List?>(null);
  // Rx<Uint8List?> imagePhotoBack = Rx<Uint8List?>(null);
  // Rx<Uint8List?> imageLiveNess = Rx<Uint8List?>(null);

  FilesImageModel filesImageFront = FilesImageModel(
    fileData: Rx<Uint8List?>(null),
    fileType: AppConst.fileTypeFront,
  );
  FilesImageModel filesImageBack = FilesImageModel(
    fileData: Rx<Uint8List?>(null),
    fileType: AppConst.fileTypeBack,
  );
  FilesImageModel filesImageLiveNess = FilesImageModel(
    fileData: Rx<Uint8List?>(null),
    fileType: AppConst.fileTypeFace,
  );

  late LiveNessRepository liveNessRepository;
  late UpdatePhotoInformationRepository updatePhotoInformationRepository;
  AppController appController = Get.find<AppController>();

  @override
  Future<void> onInit() async {
    super.onInit();
    liveNessRepository = LiveNessRepository(this);
    updatePhotoInformationRepository = UpdatePhotoInformationRepository(this);
    if (Get.arguments is AuthProfileResponseModel) {
      appController.authProfileRequestModel = Get.arguments;
    }
  }

  Future<void> routeTakePicture(bool isTakeFront) async {
    // if(!isTakeFront){
    //   if (imagePhotoFront.value == null) {
    //     showSnackBar(LocaleKeys.live_ness_validateCardFront.tr);
    //     return;
    //   }
    // }
    await _checkPermissionApp(
        onTap: () => Get.toNamed(
              AppRoutes.routeTakePictureCardKyc,
              arguments: isTakeFront ? true : false,
            ));
  }

  Future<void> routeLiveNess() async {
    if (checkStatusImage() == "") {
      await _checkPermissionApp(
          onTap: () => Get.toNamed(
                AppRoutes.routeInstructLiveNessKyc,
              ));
    } else {
      showSnackBar(checkStatusImage());
    }
  }

  ///appController.startTimer(createDialog); kịch bản dùng để khơi tạo timeout của session
  void createDialog() {
    ShowDialog.showDialogConfirm(
      LocaleKeys.dialog_titleSelectHandmade.tr,
      cancelFunc: () => clearData(),
      confirm: () => handMadeData(),
      actionTitle: LocaleKeys.dialog_handmade.tr,
      exitTitle: LocaleKeys.dialog_redo.tr,
      isActiveBack: false,
    );
  }

  void startTimeOutKyc() {
    if (appController.timer != null) {
      appController.timer?.cancel();
    }
    appController.startTimer(createDialog);
  }

  void clearData() {
    if (Get.currentRoute != AppRoutes.routeUpdatePhoToInformationKyc) {
      if (Get.currentRoute == AppRoutes.routeLiveNessKyc ||
          Get.currentRoute == AppRoutes.routeInstructLiveNessKyc) {
        appController.initCamera();
      }
      Get.until((route) =>
          Get.currentRoute == AppRoutes.routeUpdatePhoToInformationKyc);
    }

    maybeContinue = false.obs;
    filesImageFront.fileData.value = null;
    filesImageBack.fileData.value = null;
    filesImageLiveNess.fileData.value = null;
  }

  void handMadeData() {
    if (Get.currentRoute == AppRoutes.routeUpdatePhoToInformationKyc) {
      Get.toNamed(AppRoutes.routeConfirmInformation);
    } else if (Get.currentRoute == AppRoutes.routeAwaitOCRData) {
      Get.offNamed(AppRoutes.routeConfirmInformation);
    } else if (Get.currentRoute == AppRoutes.routeLiveNessKyc ||
        Get.currentRoute == AppRoutes.routeInstructLiveNessKyc) {
      appController.initCamera();
      Get.offNamed(AppRoutes.routeConfirmInformation);
    }
  }

  Future<void> _checkPermissionApp({required VoidCallback onTap}) async {
    PermissionStatus permissionStatus =
        await checkPermission([Permission.camera]);
    switch (permissionStatus) {
      case PermissionStatus.granted:
        {
          onTap();
        }
        break;
      case PermissionStatus.permanentlyDenied:
        ShowDialog.openAppSetting();
        break;
      default:
        return;
    }
  }

  String checkStatusImage() {
    String error = "";
    if (filesImageFront.fileData.value == null) {
      error = LocaleKeys.live_ness_validateCardFront.tr;
      return error;
    } else if (filesImageBack.fileData.value == null) {
      error = LocaleKeys.live_ness_validateCardBack.tr;
      return error;
    }
    return error;
  }

  Future<BaseResponseBE> sendFile(List<FilesImageModel> listFile) async {
    return await updatePhotoInformationRepository.sendFileOCR(
        listFile: listFile);
  }

  Future<void> getORC() async {
    bool isAvailable = await NfcManager.instance.isAvailable();
    if (isAvailable) {
      // Get.toNamed(
      //   AppRoutes.routeQrKyc,
      // );
      Get.toNamed(AppRoutes.routeScanNfcKyc);
    } else {
      Get.offNamed(AppRoutes.routeAwaitOCRData);
    }
    // if(maybeContinue.value){
    //
    // }
    // showLoading();
    // // await Future.delayed(Duration(seconds: 3));
    // await updatePhotoInformationRepository
    //     .getORCRepository()
    //     .then((value) async {
    //   if (value.success == EnumStatusResponse.success) {
    //     if(value.data != null){
    //       appController.infoORCRequest = value.data!;
    //     }
    //     bool isAvailable = await NfcManager.instance.isAvailable();
    //     if (isAvailable) {
    //       Get.toNamed(AppRoutes.routeScanNfcKyc);
    //     } else {
    //       Get.toNamed(AppRoutes.routeConfirmInformation);
    //     }
    //   } else {
    //     showSnackBar("Dữ liệu chưa kịp tải vui lòng chờ ....");
    //   }
    //   hideLoading();
    // });
  }

  @override
  void onClose() {
    if (appController.timer != null) {
      appController.timer?.cancel();
    }
    super.onClose();
  }
}
