import 'package:flutter/material.dart';
import 'package:two_id_c06verify/core/core.src.dart';
import 'package:two_id_c06verify/modules/register_kyc_ca/nfc_kyc/nfc_dialog/nfc_dialog.src.dart';
import 'package:two_id_c06verify/modules/register_kyc_ca/nfc_kyc/nfc_kyc.src.dart';
import 'package:two_id_c06verify/shares/shares.src.dart';

import '../../../../base_app/controllers_base/base_controller.src.dart';
import '../../../../base_app/controllers_base/base_controller/base_controller.src.dart';

class ScanNfcKycController extends BaseGetxController {
  final RxBool maybeContinue = false.obs;
  late NfcRepository nfcRepository;
  final idDocumentController = TextEditingController();
  final userNameController = TextEditingController();
  final dobController = TextEditingController();
  AppController appController = Get.find<AppController>();
  final Rx<FocusNode> idDocumentFocus = FocusNode().obs;
  final Rx<FocusNode> userNameFocus = FocusNode().obs;
  final Rx<FocusNode> dobFocus = FocusNode().obs;

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    nfcRepository = NfcRepository(this);
    idDocumentController.text =
        appController.qrUserInformation.documentNumber ?? "";
    userNameController.text = appController.qrUserInformation.fullName ?? "";
    dobController.text = appController.qrUserInformation.dateOfBirth ?? "";
    super.onInit();
  }

  Future<void> scanNfc() async {
    ShowDialog.funcOpenBottomSheet(const NfcDialog());
    // if (GetPlatform.isIOS) {
    //   NfcDialogController nfcDialogController = Get.put(NfcDialogController());
    //   await nfcDialogController.scanNFC();
    // } else if (GetPlatform.isAndroid) {
    //   ShowDialog.funcOpenBottomSheet(const NfcDialog());
    // }
  }
}
