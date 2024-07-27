import 'package:authentication_kyc/generated/locales.g.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class PackageTitleEnum {

  /// Các tiêu đề gói
  static Map<String, String> mapTitle = {
    packageUsbToken: LocaleKeys.packageService_packageToken.tr,
    packageRemoteSigning: LocaleKeys.packageService_packageRemoteSigning.tr,
    packageHSM: LocaleKeys.packageService_packageHsm.tr
  };


  static const String packageUsbToken = "USB_Token";
  static const String packageHSM = "HSM";
  static const String packageRemoteSigning = "REMOTE_SIGNING";
}
