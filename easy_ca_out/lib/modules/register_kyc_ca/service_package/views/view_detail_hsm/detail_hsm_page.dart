import 'package:easy_ca/base_app/base_app.src.dart';
import 'package:easy_ca/core/core.src.dart';
import 'package:easy_ca/generated/locales.g.dart';
import 'package:easy_ca/modules/register_kyc_ca/service_package/service_package_src.dart';
import 'package:easy_ca/shares/shares.src.dart';
import 'package:flutter/material.dart';

part 'detail_hsm_views.dart';

class DetailHsmPage extends BaseGetWidget {
  const DetailHsmPage({Key? key}) : super(key: key);

  @override
  DetailHsmController get controller => Get.put(DetailHsmController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: BackgroundAppBar.buildAppBar(
        LocaleKeys.registerCa_detailHsm.tr,
        isColorGradient: false,
        centerTitle: false,
        leading: true,
        backgroundColor: AppColors.colorTransparent,
      ),
      body: _buildBody(controller),
      bottomNavigationBar: _buildNavigationBar(controller),
    );
  }
}
