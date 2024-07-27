import 'package:authentication_kyc/core/core.src.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';

class CheckSupportNfc {
  static Future<String> checkNfcAvailability() async {
    var availability = await FlutterNfcKit.nfcAvailability;
    if (availability == NFCAvailability.available) {
      return AppConst.nfcAvailable;
    } else if (availability == NFCAvailability.not_supported) {
      return AppConst.nfcDisabledNotSupported;
    } else if (availability == NFCAvailability.disabled) {
      return AppConst.nfcDisabled;
    }
    return '';
  }
}
