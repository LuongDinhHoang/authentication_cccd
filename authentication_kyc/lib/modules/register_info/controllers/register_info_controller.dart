import 'package:flutter/material.dart';
import 'package:two_id_c06verify/base_app/base_app.src.dart';
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
    phoneNumberConfirm.text = appController.userInfoModel.phone ?? "";
    emailConfirm.text = appController.userInfoModel.email ?? "";
    userNameConfirm.text = appController.userInfoModel.username ?? "";
    password.text = convertDateToString(
      appController.userInfoModel.createdAt,
      pattern1,
    );
    passwordConfirm.text = appController.userInfoModel.status ?? "";
    super.onInit();
  }
}
