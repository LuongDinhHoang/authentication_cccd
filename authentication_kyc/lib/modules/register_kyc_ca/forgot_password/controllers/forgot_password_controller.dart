import 'package:two_id_c06verify/base_app/base_app.src.dart';
import 'package:flutter/material.dart';
import 'package:two_id_c06verify/generated/locales.g.dart';
import 'package:two_id_c06verify/modules/login/login.src.dart';
import 'package:two_id_c06verify/modules/register_kyc_ca/forgot_password/forgot_password.src.dart';

import '../../../../shares/shares.src.dart';

class ForgotPasswordController extends BaseGetxController {

  final TextEditingController textPassword = TextEditingController();

  final TextEditingController textPasswordConfirm = TextEditingController();

  final formKey = GlobalKey<FormState>();


  final Rx<FocusNode> passwordFocus = FocusNode().obs;

  final Rx<FocusNode> passwordConfirmFocus = FocusNode().obs;

  bool enableTextInput = true;

  late ForgotPasswordRepository forgotPasswordRepository = ForgotPasswordRepository(this);

  AppController appController = Get.find<AppController>();

  @override
  Future<void> onInit() async {
    // showLoading();
    // hideLoading();

    super.onInit();
  }

  Future<void> changePass()async {
    KeyBoard.hide();
    if (formKey.currentState?.validate() ?? false) {
      forgotPasswordRepository.forgotPassRepository(textPassword.text).then((value) async {
        showLoading();
        if (value.status) {
          LoginController login = Get.find();
          login.passwordController.text = textPassword.text;
          login.userNameController.text = appController.qrUserInformation.documentNumber ?? "";
          await login.confirmLogin();
          appController.clearData();
          ShowDialog.showDialogNotification(
            LocaleKeys.dialog_registerSuccess.tr,
            confirm: () {
              Get.back();
            },
            titleButton: LocaleKeys.dialog_close.tr,
          );
        } else {
          showSnackBar(value.errors?.first.message?.vn ?? "");
        }
        hideLoading();
      });
    }
  }
}
