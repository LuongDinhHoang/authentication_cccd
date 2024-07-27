import 'package:authentication_kyc/base_app/base_app.src.dart';
import 'package:authentication_kyc/core/core.src.dart';
import 'package:authentication_kyc/shares/utils/time/date_utils.dart';
import 'package:flutter/material.dart';

import '../../../../generated/locales.g.dart';
import '../../../../shares/shares.src.dart';
import '../../certificate_view.src.dart';

part 'cert_detail_view.dart';

class ConfirmDigitalSignPage
    extends BaseGetWidget<CertificateDetailController> {
  const ConfirmDigitalSignPage({Key? key}) : super(key: key);

  @override
  CertificateDetailController get controller =>
      Get.put(CertificateDetailController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: BackgroundAppBar.buildAppBar(
          controller.certificateInfo.verifyCertStatus ==
                  EnumCertVerifyStatus.verified
              ? LocaleKeys.certification_detail_cert_detail_title.tr
              : LocaleKeys.certification_detail_confirmCTSInfo.tr),
      body: _body(controller),
    );
  }
}
