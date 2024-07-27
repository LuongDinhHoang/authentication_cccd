import 'package:authentication_kyc/assets.dart';
import 'package:authentication_kyc/base_app/base_app.src.dart';
import 'package:authentication_kyc/core/core.src.dart';
import 'package:authentication_kyc/generated/locales.g.dart';
import 'package:authentication_kyc/modules/register_kyc_ca/nfc_kyc/nfc_kyc.src.dart';
import 'package:authentication_kyc/shares/shares.src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'instruct_live_ness_kyc_view.dart';

class InstructLiveNessKycPage extends BaseGetWidget<ScanNfcKycController> {
  const InstructLiveNessKycPage({Key? key}) : super(key: key);

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
      body: _body(),
    );
  }
}
