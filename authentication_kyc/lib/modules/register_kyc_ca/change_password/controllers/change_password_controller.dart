import 'package:authentication_kyc/base_app/base_app.src.dart';
import 'package:flutter/material.dart';

import '../../../../shares/shares.src.dart';

class ChangePasswordController extends BaseGetxController {
  final TextEditingController textPasswordOld = TextEditingController();

  final TextEditingController textPasswordNew = TextEditingController();

  final TextEditingController textPasswordConfirm = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final Rx<FocusNode> passwordOldFocus = FocusNode().obs;

  final Rx<FocusNode> passwordNewFocus = FocusNode().obs;

  final Rx<FocusNode> passwordConfirmFocus = FocusNode().obs;

  bool enableTextInput = true;


  @override
  Future<void> onInit() async {
    // showLoading();
    // hideLoading();

    super.onInit();
  }
}
