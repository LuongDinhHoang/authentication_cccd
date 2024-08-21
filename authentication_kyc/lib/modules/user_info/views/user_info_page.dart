import 'package:flutter/material.dart';
import 'package:two_id_c06verify/base_app/base_app.src.dart';
import 'package:two_id_c06verify/core/core.src.dart';
import 'package:two_id_c06verify/generated/locales.g.dart';
import 'package:two_id_c06verify/modules/register_kyc_ca/change_password/change_password.src.dart';
import 'package:two_id_c06verify/modules/user_info/user_info.src.dart';
import 'package:two_id_c06verify/shares/widgets/form/base_form_login.dart';

import '../../../../shares/shares.src.dart';

part 'user_info_view.dart';

class UserInfoPage extends BaseGetWidget<UserInfoController> {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  UserInfoController get controller => Get.put(UserInfoController());

  @override
  Widget buildWidgets(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Scaffold(
      backgroundColor: AppColors.basicWhite,
      appBar: BackgroundAppBar.buildAppBar(
        LocaleKeys.home_changePassword.tr,
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
