import 'package:flutter/material.dart';
import 'package:two_id_c06verify/base_app/base_app.src.dart';
import 'package:two_id_c06verify/core/core.src.dart';
import 'package:two_id_c06verify/generated/locales.g.dart';
import 'package:two_id_c06verify/modules/register_info/register_info.src.dart';
import 'package:two_id_c06verify/shares/widgets/form/base_form_login.dart';

import '../../../../shares/shares.src.dart';

part 'register_info_view.dart';

class RegisterInfoPage extends BaseGetWidget<RegisterInfoController> {
  const RegisterInfoPage({Key? key}) : super(key: key);

  @override
  RegisterInfoController get controller => Get.put(RegisterInfoController());

  @override
  Widget buildWidgets(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Scaffold(
      backgroundColor: AppColors.basicWhite,
      appBar: BackgroundAppBar.buildAppBar(
        LocaleKeys.home_accountInfo.tr,
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
