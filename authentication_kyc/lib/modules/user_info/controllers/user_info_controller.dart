import 'package:flutter/material.dart';
import 'package:two_id_c06verify/base_app/base_app.src.dart';
import 'package:two_id_c06verify/shares/utils/time/date_utils.dart';

import '../../../../shares/shares.src.dart';

class UserInfoController extends BaseGetxController {
  final TextEditingController phoneNumberConfirm = TextEditingController();

  final TextEditingController emailConfirm = TextEditingController();

  final TextEditingController userNameConfirm = TextEditingController();

  final TextEditingController registerDateConfirm = TextEditingController();

  final TextEditingController statusConfirm = TextEditingController();

  AppController appController = Get.find<AppController>();

  final formKey = GlobalKey<FormState>();

  final Rx<FocusNode> phoneNumberFocus = FocusNode().obs;

  final Rx<FocusNode> emailFocus = FocusNode().obs;

  final Rx<FocusNode> userNameFocus = FocusNode().obs;

  final Rx<FocusNode> registerDateFocus = FocusNode().obs;

  final Rx<FocusNode> statusFocus = FocusNode().obs;

  @override
  Future<void> onInit() async {
    phoneNumberConfirm.text = appController.userInfoModel.phone ?? "";
    emailConfirm.text = appController.userInfoModel.email ?? "";
    userNameConfirm.text = appController.userInfoModel.username ?? "";
    registerDateConfirm.text = convertDateToString(
      appController.userInfoModel.createdAt,
      pattern1,
    );
    statusConfirm.text = appController.userInfoModel.status ?? "";
    super.onInit();
  }
}
