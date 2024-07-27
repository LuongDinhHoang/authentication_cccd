import 'package:authentication_kyc/assets.dart';
import 'package:authentication_kyc/base_app/base_app.src.dart';
import 'package:authentication_kyc/core/core.src.dart';
import 'package:authentication_kyc/generated/locales.g.dart';
import 'package:authentication_kyc/modules/login/controllers/login_controller.dart';
import 'package:authentication_kyc/shares/widgets/text/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../shares/shares.src.dart';
import '../../../shares/widgets/form/base_form_login.dart';

part 'login_view.dart';

class LoginPage extends BaseGetWidget<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginController get controller => Get.put(LoginController());

  @override
  Widget buildWidgets(context) {
    return Scaffold(
      body: _body(controller),
      bottomNavigationBar:
          _buildDevelopBy().paddingOnly(bottom: AppDimens.padding5),
    );
  }
}
