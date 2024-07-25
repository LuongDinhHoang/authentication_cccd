import 'package:easy_ca/assets.dart';
import 'package:easy_ca/base_app/base_app.src.dart';
import 'package:easy_ca/core/core.src.dart';
import 'package:easy_ca/generated/locales.g.dart';
import 'package:easy_ca/modules/register_kyc_ca/service_package/service_package_src.dart';
import 'package:easy_ca/shares/shares.src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'register_ca_view.dart';

class RegisterServiceCAPage extends BaseGetWidget<RegisterServiceCaController>{
  const RegisterServiceCAPage({Key? key}) : super(key: key);

  @override
  RegisterServiceCaController get controller => Get.put(RegisterServiceCaController());

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
    );
  }

}
