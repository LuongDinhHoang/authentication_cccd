import 'package:two_id_c06verify/core/core.src.dart';
import 'package:two_id_c06verify/modules/register_kyc_ca/nfc_kyc/nfc_kyc.src.dart';
import 'package:two_id_c06verify/shares/shares.src.dart';
import 'package:flutter/material.dart';

import '../../../../base_app/controllers_base/base_controller/base_controller.src.dart';

class ScanNfcKycController extends BaseGetxController {
  final RxBool maybeContinue = false.obs;
  late NfcRepository nfcRepository;

  @override
  void onInit() {
    nfcRepository = NfcRepository(this);
    super.onInit();
  }

  Future<void> funcCheckIn(Widget child) async {
    Get.dialog(
      child,
      barrierDismissible: false,
    );
  }

  Future<void> getInfoORC() async {
    Get.toNamed(AppRoutes.routeAwaitOCRData);
  }
}
