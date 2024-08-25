import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:two_id_c06verify/base_app/base_app.src.dart';
import 'package:two_id_c06verify/core/core.src.dart';
import 'package:two_id_c06verify/generated/locales.g.dart';
import 'package:two_id_c06verify/modules/provision/provision.src.dart';
import 'package:two_id_c06verify/modules/user_info/user_info.src.dart';
import 'package:two_id_c06verify/shares/widgets/form/base_form_login.dart';

import '../../../../shares/shares.src.dart';

part 'provision_view.dart';

class ProvisionPage extends BaseGetWidget<ProvisionController> {
  const ProvisionPage({Key? key}) : super(key: key);

  @override
  ProvisionController get controller => Get.put(ProvisionController());

  @override
  Widget buildWidgets(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Scaffold(
      backgroundColor: AppColors.basicWhite,
      appBar: BackgroundAppBar.buildAppBar(
        "Điều khoản & Điều kiện",
        isColorGradient: false,
        centerTitle: false,
        leading: true,
        backgroundColor: AppColors.basicWhite,
      ),
      body: baseShowLoading(
        () => SizedBox(
            height: Get.height, width: Get.width, child: _itemBody(controller)),
      ),
      // bottomSheet: Column(
      //   children: [
      //     ButtonUtils.buildButton(LocaleKeys.home_agree.tr, () async {
      //       Get.toNamed(AppRoutes.routeQrKyc);
      //     },
      //         isLoading: controller.isShowLoading.value,
      //         backgroundColor: AppColors.primaryBlue1,
      //         colorText: AppColors.basicWhite),
      //     sdsSB5,
      //   ],
      // ),
    );
  }
}
