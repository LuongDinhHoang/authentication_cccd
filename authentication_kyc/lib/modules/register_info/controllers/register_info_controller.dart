import 'package:flutter/material.dart';
import 'package:two_id_c06verify/base_app/base_app.src.dart';
import 'package:two_id_c06verify/generated/locales.g.dart';
import 'package:two_id_c06verify/modules/register_info/register_info.src.dart';
import 'package:two_id_c06verify/shares/utils/time/date_utils.dart';

import '../../../../shares/shares.src.dart';

class RegisterInfoController extends BaseGetxController {
  final TextEditingController phoneNumberConfirm = TextEditingController();

  final TextEditingController emailConfirm = TextEditingController();

  final TextEditingController userNameConfirm = TextEditingController();

  final TextEditingController password = TextEditingController();

  final TextEditingController passwordConfirm = TextEditingController();

  AppController appController = Get.find<AppController>();

  final formKey = GlobalKey<FormState>();

  final Rx<FocusNode> phoneNumberFocus = FocusNode().obs;

  final Rx<FocusNode> emailFocus = FocusNode().obs;

  final Rx<FocusNode> userNameFocus = FocusNode().obs;

  final Rx<FocusNode> passwordFocus = FocusNode().obs;

  final Rx<FocusNode> passwordConfirmFocus = FocusNode().obs;

  @override
  Future<void> onInit() async {
    userNameConfirm.text = appController.qrUserInformation.documentNumber ?? "";
    super.onInit();
  }

  Future<void> registerInfo() async {
    if (formKey.currentState?.validate() ?? false) {
      RegisterRequestModel registerRequestModel = RegisterRequestModel(
        username: userNameConfirm.text,
        email: emailConfirm.text.isEmpty ? null : emailConfirm.text,
        password: password.text,
        fullName: appController.sendNfcRequestGlobalModel.nameVNM,
        citizenNumber: appController.sendNfcRequestGlobalModel.numberVMN,
        dateOfBirth: convertDateToString(
            convertStringToDate(
                appController.sendNfcRequestGlobalModel.dobVMN, pattern1),
            patternDefault),
        gender: appController.sendNfcRequestGlobalModel.sexVMN?.toUpperCase() ==
                "NAM"
            ? "MALE"
            : "FEMALE",
        nationality: appController.sendNfcRequestGlobalModel.nationalityVMN,
        nativeLand: appController.sendNfcRequestGlobalModel.nationalityVMN,
        ethnic: appController.sendNfcRequestGlobalModel.nationalityVMN,
        religion: appController.sendNfcRequestGlobalModel.religionVMN,
        address: appController.sendNfcRequestGlobalModel.residentVMN,
        issueDate: convertDateToString(
            convertStringToDate(
                appController.sendNfcRequestGlobalModel.registrationDateVMN,
                pattern1),
            patternDefault),
        issuePlate: LocaleKeys.nfcInformationUserPage_locationTitle.tr,
        expiredDate: convertDateToString(
            convertStringToDate(
                appController.sendNfcRequestGlobalModel.doe, pattern1),
            patternDefault),
        identification: appController.sendNfcRequestGlobalModel.otherPaper,
        phone: phoneNumberConfirm.text,
        // secretKey:
      );
    }
  }
}
