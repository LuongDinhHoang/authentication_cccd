import 'package:easy_ca/assets.dart';
import 'package:easy_ca/base_app/base_app.src.dart';
import 'package:easy_ca/core/core.src.dart';
import 'package:easy_ca/generated/locales.g.dart';
import 'package:easy_ca/modules/register_kyc_ca/verify_profile_ca/verify_profile_ca_src.dart';
import 'package:easy_ca/shares/shares.src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'authentication_guide_view.dart';

class AuthenticationGuidePage extends BaseGetWidget {
  const AuthenticationGuidePage({Key? key}) : super(key: key);

  @override
  AuthenticationGuideController get controller =>
      Get.put(AuthenticationGuideController());

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
      body: _buildBody().paddingSymmetric(horizontal: AppDimens.padding16),
      bottomNavigationBar: _buildButton(controller),
    );
  }
}
