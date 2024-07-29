import 'package:app_settings/app_settings.dart';
import 'package:two_id_c06verify/shares/widgets/dialog/dialog_utils.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';

class Biometrics {
  factory Biometrics() => _singleton;

  Biometrics._internal();

  static final Biometrics _singleton = Biometrics._internal();

  LocalAuthentication auth = LocalAuthentication();

  Future<bool?> checkBiometrics() async {
    bool? canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } catch (e) {
      // print(e);
    }

    return canCheckBiometrics;
  }

  Future<List<BiometricType>?> getAvailableBiometrics() async {
    List<BiometricType>? availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } catch (e) {
      // print(e);
    }

    return availableBiometrics;
  }

  Future<bool?> authenticate(
      {String localizedReasonStr =
          "Quý khách vui lòng quét vân tay hoặc khuôn mặt để xác thực",
      Function? onDeviceUnlockUnavailable,
      Function? onAfterLimit}) async {
    bool authenticated = false;
    auth = LocalAuthentication();
    try {
      authenticated = await auth.authenticate(
        authMessages: <AuthMessages>[
          const IOSAuthMessages(
            cancelButton: "Hủy",
            goToSettingsButton: "Cài đặt",
            goToSettingsDescription: "Vui lòng cài đặt vân tay",
            lockOut: "Vui lòng kích hoạt bảo mật vân tay",
          ),
          const AndroidAuthMessages(
            cancelButton: "Hủy",
            biometricHint: "Xác thực",
            biometricNotRecognized: "Vân tay không hợp lệ",
            biometricRequiredTitle: "Xác thực",
            biometricSuccess: "Xac thực thành công",
            goToSettingsButton: "Cài đặt",
            goToSettingsDescription: "Xác thực",
            signInTitle: "App Authentication",
          ),
        ],
        localizedReason: localizedReasonStr,
        options: const AuthenticationOptions(
            useErrorDialogs: false,
            sensitiveTransaction: false,
            stickyAuth: true),
      );
    } catch (e) {
      print("88888--$e");
      if (e is PlatformException) {
        if (e.code == auth_error.lockedOut) {
          if (onAfterLimit!() != null) {
            onAfterLimit();
          }
        } else if (e.code == auth_error.notEnrolled ||
            e.code == auth_error.notAvailable) {
          ShowDialog.showDialogConfirm(
            "Quý khách chưa cài đặt phương thức xác thực nào! Vui lòng cài đặt phương thức xác thực để tiếp tục sử dụng.",
            actionTitle: "Cài đặt",
            confirm: () {
              AppSettings.openAppSettings(type: AppSettingsType.security);
              // Get.back();
            },
          );
          // ShowPopup.showDialogConfirm(AppStr.biometricDeviceUnAvailable.tr,
          //     confirm: () {
          //   AppSettings.openSecuritySettings();
          //   Get.back();
          // }, actionTitle: AppStr.openSettings.tr);
        } else if (e.code == auth_error.passcodeNotSet) {
          if (onDeviceUnlockUnavailable != null) {
            onDeviceUnlockUnavailable();
            return null;
          } else {
            authenticated = true;
          }
        }
      }

      try {
        auth.stopAuthentication();
      } catch (ex) {}
    }
    return authenticated;
  }

  void cancelAuthentication() {
    auth.stopAuthentication();
  }
}
