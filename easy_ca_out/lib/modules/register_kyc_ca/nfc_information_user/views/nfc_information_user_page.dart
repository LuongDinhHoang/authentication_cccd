import 'dart:convert';

import 'package:easy_ca/assets.dart';
import 'package:easy_ca/base_app/base_app.src.dart';
import 'package:easy_ca/core/core.src.dart';
import 'package:easy_ca/generated/locales.g.dart';
import 'package:easy_ca/modules/register_kyc_ca/nfc_information_user/controllers/nfc_information_user_controller.dart';
import 'package:easy_ca/shares/shares.src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'nfc_information_user_view.dart';

class NfcInformationUserPage extends BaseGetWidget {
  const NfcInformationUserPage({Key? key}) : super(key: key);

  @override
  NfcInformationUserController get controller =>
      Get.put(NfcInformationUserController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: BackgroundAppBar.buildAppBar(
        LocaleKeys.nfcInformationUserPage_information.tr,
        isColorGradient: false,
        centerTitle: false,
        leading: true,
        backgroundColor: AppColors.colorTransparent,
      ),
      body: _buildListGuild(controller)
          .paddingSymmetric(horizontal: AppDimens.padding20),
      bottomNavigationBar: Obx(
        () => ButtonUtils.buildButton(
          LocaleKeys.registerCa_continue.tr,
          () async {
            await controller.sendNfcData();
          },
          isLoading: controller.isShowLoading.value,
          backgroundColor: AppColors.primaryCam1,
          borderRadius: BorderRadius.circular(AppDimens.radius4),
          height: AppDimens.iconHeightButton,
        ).paddingAll(AppDimens.paddingDefaultHeight),
      ),
    );
  }
}
