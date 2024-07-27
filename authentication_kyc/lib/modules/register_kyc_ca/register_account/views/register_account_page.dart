import 'package:authentication_kyc/base_app/base_app.src.dart';
import 'package:authentication_kyc/core/core.src.dart';
import 'package:authentication_kyc/generated/locales.g.dart';
import 'package:authentication_kyc/modules/register_kyc_ca/register_account/register_account_src.dart';
import 'package:authentication_kyc/shares/shares.src.dart';
import 'package:flutter/material.dart';

part 'register_account_view.dart';

class RegisterAccountPage extends BaseGetWidget {
  const RegisterAccountPage({Key? key}) : super(key: key);

  @override
  RegisterAccountController get controller =>
      Get.put(RegisterAccountController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
        appBar: BackgroundAppBar.buildAppBar(
          LocaleKeys.registerCa_tileAppbarCa.tr,
          isColorGradient: false,
          centerTitle: false,
          leading: true,
          backgroundColor: AppColors.colorTransparent,
        ),
        body: _buildBody(controller),
        bottomSheet: _buildRegister(controller));
  }
}
