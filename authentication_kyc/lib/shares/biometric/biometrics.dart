import 'package:app_settings/app_settings.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:two_id_c06verify/generated/locales.g.dart';
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
          LocaleKeys.biometric_authenticationTitle,
      Function? onDeviceUnlockUnavailable,
      Function? onAfterLimit}) async {
    bool authenticated = false;
    auth = LocalAuthentication();
    try {
      authenticated = await auth.authenticate(
        authMessages: <AuthMessages>[
          IOSAuthMessages(
            cancelButton: LocaleKeys.biometric_cancelButton.tr,
            goToSettingsButton: LocaleKeys.biometric_setting.tr,
            goToSettingsDescription: LocaleKeys.biometric_authenticationContent.tr,
            lockOut: LocaleKeys.biometric_lockout.tr,
          ),
          AndroidAuthMessages(
            cancelButton: LocaleKeys.biometric_cancelButton.tr,
            biometricHint: LocaleKeys.biometric_authentication.tr,
            biometricNotRecognized: LocaleKeys.biometric_authenticationError.tr,
            biometricRequiredTitle: LocaleKeys.biometric_authentication.tr,
            biometricSuccess: LocaleKeys.biometric_authenticationSuccess.tr,
            goToSettingsButton: LocaleKeys.biometric_setting.tr,
            goToSettingsDescription: LocaleKeys.biometric_authentication.tr,
            signInTitle: LocaleKeys.biometric_authentication.tr,
          ),
        ],
        localizedReason: localizedReasonStr.tr,
        options: const AuthenticationOptions(
            useErrorDialogs: false,
            sensitiveTransaction: false,
            stickyAuth: true),
      );
    } catch (e) {
      if (e is PlatformException) {
        if (e.code == auth_error.lockedOut) {
          if (onAfterLimit!() != null) {
            onAfterLimit();
          }
        } else if (e.code == auth_error.notEnrolled ||
            e.code == auth_error.notAvailable) {
          ShowDialog.showDialogConfirm(
            LocaleKeys.biometric_noAuthenticationError.tr,
            actionTitle: LocaleKeys.biometric_setting.tr,
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
