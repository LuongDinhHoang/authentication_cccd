import 'package:fluttertoast/fluttertoast.dart';
import 'package:two_id_c06verify/base_app/base_app.src.dart';
import 'package:two_id_c06verify/core/core.src.dart';
import 'package:two_id_c06verify/generated/locales.g.dart';
import 'package:two_id_c06verify/modules/register_kyc_ca/nfc_kyc/nfc_kyc.src.dart';
import 'package:two_id_c06verify/shares/utils/time/date_utils.dart';

import '../../../../shares/shares.src.dart';

class NfcInformationUserController extends BaseGetxController {
  // String? idDocument = '';
  // String? firstName = '';
  // String? lastName = '';

  // String? gender;
  // String? nationality;
  String? dateOfBirth;
  String? dateOfExpiry;
  String? image;
  bool authenticationSuccess = false;
  RxBool authenticationVisible = false.obs;
  SendNfcRequestModel sendNfcRequestModel = SendNfcRequestModel();
  AppController appController = Get.find<AppController>();
  late NfcRepository nfcRepository;

  @override
  void onInit() {
    setupData();
    super.onInit();
  }

  Future<void> setupData() async {
    nfcRepository = NfcRepository(this);

    if (Get.arguments != null) {
      /*if (Get.arguments[1] is DataOcrModel) {
        dataOcrModel = Get.arguments[1];
      }*/
      if (Get.arguments is SendNfcRequestModel) {
        sendNfcRequestModel = Get.arguments;
        // idDocument = sendNfcRequestModel.number;
        // firstName = sendNfcRequestModel.nameVNM;
        // lastName = sendNfcRequestModel.lastName;
        // gender = sendNfcRequestModel.sexVMN /*== "M"
        //     ? LocaleKeys.nfcInformationUserPage_sexM.tr
        //     : LocaleKeys.nfcInformationUserPage_sexF.tr*/;
        dateOfBirth = convertDateToString(
          convertStringToDate(
            sendNfcRequestModel.dob,
            pattern5,
          ),
          pattern1,
        );
        dateOfExpiry = convertDateToString(
          convertStringToDate(
            sendNfcRequestModel.doe,
            pattern5,
          ),
          pattern1,
        );
        // nationality = sendNfcRequestModel.nationVNM;
        image = sendNfcRequestModel.file;
        if (appController.typeAuthentication == AppConst.typeAuthentication) {
          await nfcRepository
              .sendNfcRepository(sendNfcRequestModel)
              .then((value) {
            authenticationSuccess = value.status;
            authenticationVisible.value = true;
          });
        }
      }
    }
  }

  Future<void> goPage() async {
    await Biometrics().authenticate(
        // localizedReasonStr: "Quý khách vui lòng quét vân tay hoặc khuôn mặt để xác thực",
        onDeviceUnlockUnavailable: () async {
      await gotoPage();
    }, onAfterLimit: () {
      Fluttertoast.showToast(
          msg: LocaleKeys.biometric_msgLimit.tr,
          toastLength: Toast.LENGTH_LONG);
    }).then((isAuthenticated) async {
      if(isAuthenticated ?? false){
        await gotoPage();

      }
    });
    // if (convertStringToDate(
    //       sendNfcRequestModel.doe,
    //       pattern5,
    //     )?.isAfter(DateTime.now()) ??
    //     true) {
    //   showLoading();
    //   await nfcRepository.sendNfcRepository(sendNfcRequestModel);
    //   appController.sendNfcRequestGlobalModel = sendNfcRequestModel;
    //   hideLoading();
    //   Get.toNamed(
    //     AppRoutes.routeInstructLiveNessKyc,
    //   );
    //   // Get.toNamed(AppRoutes.routeAwaitOCRData);
    // } else {
    //   if (appController.configCertificateModel.isCreateCertificate) {
    //     if (Get.isRegistered<RegisterAccountController>()) {
    //       Get.until(
    //           (route) => route.settings.name == AppRoutes.routeRegisterAccount);
    //     }
    //   } else {
    //     if (Get.isRegistered<VerifyProfileController>()) {
    //       Get.until(
    //           (route) => route.settings.name == AppRoutes.routeVerifyProfile);
    //     }
    //   }
    //   showSnackBar(LocaleKeys.nfc_nfc_expired_message.tr);
    // }
  }

  Future<void> gotoPage() async {
    if (appController.typeAuthentication == AppConst.typeRegister) {
      Get.toNamed(AppRoutes.routeRegisterInfo);
    } else if (appController.typeAuthentication == AppConst.typeForgotPass) {
      Get.toNamed(AppRoutes.routeForgotPass);
    }
  }
}
