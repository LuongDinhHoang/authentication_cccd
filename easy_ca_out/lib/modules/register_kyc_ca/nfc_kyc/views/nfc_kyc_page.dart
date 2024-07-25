import 'package:easy_ca/assets.dart';
import 'package:easy_ca/base_app/base_app.src.dart';
import 'package:easy_ca/core/core.src.dart';
import 'package:easy_ca/generated/locales.g.dart';
import 'package:easy_ca/modules/register_kyc_ca/nfc_kyc/nfc_dialog/nfc_dialog.src.dart';
import 'package:easy_ca/modules/register_kyc_ca/nfc_kyc/nfc_kyc.src.dart';
import 'package:easy_ca/modules/register_kyc_ca/nfc_kyc/views/video_scan_nfc_page.dart';
import 'package:easy_ca/shares/shares.src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'nfc_kyc_view.dart';

class ScanNfcKycPage extends BaseGetWidget<ScanNfcKycController> {
  const ScanNfcKycPage({Key? key}) : super(key: key);

  @override
  ScanNfcKycController get controller => Get.put(ScanNfcKycController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: BackgroundAppBar.buildAppBar(
        LocaleKeys.update_information_kyc_registerCa.tr,
        isColorGradient: false,
        centerTitle: false,
        leading: true,
        backgroundColor: AppColors.colorTransparent,
      ),
      body: _body(controller),
    );
  }
}
