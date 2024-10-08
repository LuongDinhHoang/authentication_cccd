import 'package:two_id_c06verify/base_app/base_app.src.dart';
import 'package:two_id_c06verify/core/core.src.dart';
import 'package:two_id_c06verify/generated/locales.g.dart';
import 'package:two_id_c06verify/modules/register_kyc_ca/service_package/service_package_src.dart';
import 'package:flutter/material.dart';

import '../../../../../shares/shares.src.dart';

part 'choose_package_view.dart';

class ChoosePackagePage extends BaseGetWidget {
  const ChoosePackagePage({Key? key}) : super(key: key);

  @override
  ChoosePackageController get controller => Get.put(ChoosePackageController());

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
      body: baseShowLoadingCustom(
        () => _buildBody(controller),
      ),
      bottomSheet: _buildPolicyPrivacy(controller),
    );
  }
}
