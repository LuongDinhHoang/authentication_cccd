import 'package:flutter/material.dart';
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
        backgroundColor: AppColors.colorTransparent,
      ),
      body: SizedBox(
          height: Get.height, width: Get.width, child: _itemBody(controller)),
    );
  }
}
