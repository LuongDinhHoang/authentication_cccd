import 'package:easy_ca/base_app/base_app.src.dart';
import 'package:easy_ca/core/core.src.dart';
import 'package:easy_ca/shares/utils/time/date_utils.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRController extends BaseGetxController {
  String? barcodeController;
  String? idIdentity;
  String? information;
  String? informationIdCard;
  final AppController appController = Get.find<AppController>();


  // UserInformation userInformation = UserInformation();
  late MobileScannerController cameraController;
  RxDouble zoomX = 6.0.obs;

  @override
  Future<void> onInit() async {
    showLoading();
    cameraController = MobileScannerController(
      detectionSpeed: DetectionSpeed.normal,
      facing: CameraFacing.back,
      // torchEnabled: true,
    );
    hideLoading();

    super.onInit();
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    cameraController.dispose();
  }

  void getData(String barcodeScanRes) {
    barcodeController = barcodeScanRes;
    idIdentity = barcodeController?.substring(0, 12);
    information = barcodeController?.substring(13);
    List<String> splitStrings = information?.split("|") ?? [];
    if(splitStrings.isNotEmpty){
      DateTime? dateTimeDob = _convertDatetimeQr(splitStrings[2]);
      DateTime? dateTimeDor = _convertDatetimeQr(splitStrings[5]);
      if (dateTimeDob != null && dateTimeDor != null) {
        appController.qrUserInformation.documentNumber = idIdentity;
        appController.qrUserInformation.dateOfBirth = convertDateToString(dateTimeDob, pattern1);
        appController.qrUserInformation.dateOfExpiry = convertDateToString(
          calculateExpiryDate(dateTimeDob, dateTimeDor),
          pattern1,
        );
        appController.qrUserInformation.fullName = splitStrings[1];
        appController.qrUserInformation.gender = splitStrings[3];
        appController.qrUserInformation.gender = splitStrings[4];
        appController.qrUserInformation.informationIdCard = splitStrings[0];

      }
      // if (splitStrings[0] == "") {
      //   appController.qrUserInformation.informationIdCard = "";
      //
      // }else{
      //   appController.qrUserInformation.informationIdCard = splitStrings[0];
      // }
      Get.offNamed(AppRoutes.routeScanNfcKyc);

    }

    // print(calculateExpiryDate(_convertDatetimeQr(splitStrings[5])),
    //     _convertDatetimeQr(splitStrings[5]))
    // );
    // userInformation.documentNumber = idIdentity;
    // userInformation.raw = barcodeController;Yeah
    //
    // for (var i = 0; i < splitStrings.length; i++) {
    //   if (splitStrings[0] == "") {
    //     userInformation.fullName = splitStrings[1];
    //     userInformation.dateOfBirth = formatDateString(splitStrings[2]);
    //     // userInformation.dateOfBirth = splitStrings[2];
    //     userInformation.gender = splitStrings[3];
    //     userInformation.address = splitStrings[4];
    //     userInformation.dateOfIssuer = formatDateString(splitStrings[5]);
    //     userInformation.informationIdCard = "";
    //   } else {
    //     userInformation.informationIdCard = splitStrings[0];
    //     userInformation.fullName = splitStrings[1];
    //     userInformation.dateOfBirth = formatDateString(splitStrings[2]);
    //     // userInformation.dateOfBirth = splitStrings[2];
    //     userInformation.gender = splitStrings[3];
    //     userInformation.address = splitStrings[4];
    //     userInformation.dateOfIssuer = formatDateString(splitStrings[5]);
    //   }
    // }
  }

  DateTime? calculateExpiryDate(DateTime? birthDate, DateTime? issueDate) {
    if (birthDate != null && issueDate != null) {
      Duration difference = issueDate.difference(birthDate);

      int numberYear = difference.inDays ~/ 365;

      if (numberYear < 23) {
        return DateTime(birthDate.year + 25, birthDate.month, birthDate.day);
      } else if (23 <= numberYear && numberYear < 38) {
        return DateTime(birthDate.year + 40, birthDate.month, birthDate.day);
      } else if (38 <= numberYear && numberYear <= 58) {
        return DateTime(birthDate.year + 60, birthDate.month, birthDate.day);
      } else {
        return null;
      }
    }
    return null;
  }

  DateTime? _convertDatetimeQr(String dateString) {
    if (dateString.length == 8) {
      int day = int.parse(dateString.substring(0, 2));
      int month = int.parse(dateString.substring(2, 4));
      int year = int.parse(dateString.substring(4, 8));

      return DateTime(year, month, day);
    }
    return null;
  }
}
