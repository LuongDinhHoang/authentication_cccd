import 'package:authentication_kyc/base_app/base_app.src.dart';
import 'package:authentication_kyc/core/core.src.dart';
import 'package:authentication_kyc/generated/locales.g.dart';
import 'package:authentication_kyc/modules/register_kyc_ca/change_password/change_password.src.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../shares/shares.src.dart';

part 'change_password_view.dart';

class ChangePasswordPage extends BaseGetWidget<ChangePasswordController> {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  ChangePasswordController get controller =>
      Get.put(ChangePasswordController());

  Widget _buildBody() {
    return Scaffold(
      backgroundColor: AppColors.basicWhite,
      appBar: BackgroundAppBar.buildAppBar(
        "Đổi mặt khẩu",
        isColorGradient: false,
        centerTitle: false,
        leading: true,
        backgroundColor: AppColors.colorTransparent,
      ),
      body: SizedBox(
          height: Get.height, width: Get.width, child: _itemBody(controller)),
    );
  }

  @override
  Widget buildWidgets(BuildContext context) {
    return Obx(() => controller.isShowLoading.value
        ? Container(
            color: Colors.white,
            child: const Center(child: CupertinoActivityIndicator()))
        : _buildBody());
  }
}
