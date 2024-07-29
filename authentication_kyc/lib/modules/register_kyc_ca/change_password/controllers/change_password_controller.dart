import 'package:authentication_kyc/base_app/base_app.src.dart';
import 'package:flutter/material.dart';

import '../../../../shares/shares.src.dart';

class ChangePasswordController extends BaseGetxController {
  final TextEditingController textEditIdNumber = TextEditingController();

  final TextEditingController textEditNumberPhone = TextEditingController();

  final TextEditingController textEditEmail = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final Rx<FocusNode> idNumberFocus = FocusNode().obs;

  final Rx<FocusNode> numberPhoneFocus = FocusNode().obs;

  final Rx<FocusNode> emailFocus = FocusNode().obs;

  bool enableTextInput = true;


  @override
  Future<void> onInit() async {
    // showLoading();
    // hideLoading();

    super.onInit();
  }
}
