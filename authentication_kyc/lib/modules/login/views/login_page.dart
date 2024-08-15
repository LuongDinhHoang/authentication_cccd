import 'package:two_id_c06verify/assets.dart';
import 'package:two_id_c06verify/base_app/base_app.src.dart';
import 'package:two_id_c06verify/core/core.src.dart';
import 'package:two_id_c06verify/generated/locales.g.dart';
import 'package:two_id_c06verify/modules/login/controllers/login_controller.dart';
import 'package:two_id_c06verify/shares/widgets/text/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:local_auth/local_auth.dart';

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
      // bottomNavigationBar:
      //     _buildDevelopBy().paddingOnly(bottom: AppDimens.padding5),
    );
  }
}
