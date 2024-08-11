import 'dart:convert';

import 'package:two_id_c06verify/assets.dart';
import 'package:two_id_c06verify/base_app/base_app.src.dart';
import 'package:two_id_c06verify/core/core.src.dart';
import 'package:two_id_c06verify/generated/locales.g.dart';
import 'package:two_id_c06verify/modules/register_kyc_ca/nfc_information_user/controllers/nfc_information_user_controller.dart';
import 'package:two_id_c06verify/shares/shares.src.dart';
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
          backgroundColor: AppColors.primaryBlue1,
          borderRadius: BorderRadius.circular(AppDimens.radius4),
          height: AppDimens.iconHeightButton,
        ).paddingAll(AppDimens.paddingDefaultHeight),
      ),
    );
  }
}
