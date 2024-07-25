import 'package:easy_ca/base_app/base_app.src.dart';
import 'package:easy_ca/core/core.src.dart';
import 'package:easy_ca/generated/locales.g.dart';
import 'package:easy_ca/shares/shares.src.dart';
import 'package:easy_ca/shares/widgets/bottom_sheet/bottom_sheet.src.dart';
import 'package:flutter/material.dart';

class AuthenticationGuideController extends BaseGetxController
    with WidgetsBindingObserver {
  /// Chuyển sang màn tạo tài khoản
  final isCreateAcc = true;

  String statusNFC = "";

  @override
  Future<void> onInit() async {
    statusNFC = await CheckSupportNfc.checkNfcAvailability();
    WidgetsBinding.instance.addObserver(this);
    super.onInit();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  void showNfcBottomSheet(bool isSupportNfc) {
    Get.bottomSheet(
      SDSBottomSheet(
        title: "",
        body: BottomSheetCheckNfc(isSupportNfc),
        noHeader: true,
      ),
      isScrollControlled: true,
    );
  }

  void checkAvailabilityNfc() async {
    if (statusNFC == AppConst.nfcAvailable) {
      Get.toNamed(AppRoutes.routeScanNfcKyc);
    } else if (statusNFC == AppConst.nfcDisabled) {
      showNfcBottomSheet(true);
    } else if (statusNFC == AppConst.nfcDisabledNotSupported) {
      showNfcBottomSheet(false);
      // // Get.toNamed(AppRoutes.routeVerifyProfile);
      // Get.toNamed(AppRoutes.routeAuthenticationGuide);
    }
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      statusNFC = await CheckSupportNfc.checkNfcAvailability();
      if (Get.currentRoute == AppRoutes.routeAuthenticationGuide) {
        if (statusNFC == AppConst.nfcAvailable) {
          if (Get.isBottomSheetOpen ?? false) {
            Get.back();
            showSnackBar(LocaleKeys.check_nfc_nfc_open.tr);
          }
        }
      }
    }
  }
}
