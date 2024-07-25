import 'package:easy_ca/assets.dart';
import 'package:easy_ca/base_app/base_app.src.dart';
import 'package:easy_ca/core/core.src.dart';
import 'package:easy_ca/generated/locales.g.dart';
import 'package:easy_ca/modules/login/controllers/login_controller.dart';
import 'package:easy_ca/shares/widgets/text/font_style.dart';
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
