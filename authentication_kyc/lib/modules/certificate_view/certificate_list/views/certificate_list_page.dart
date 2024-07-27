import 'package:authentication_kyc/base_app/views_base/base_widget.dart';
import 'package:authentication_kyc/shares/utils/time/date_utils.dart';
import 'package:authentication_kyc/shares/widgets/text/font_style.dart';
import 'package:flutter/material.dart';

import '../../../../core/core.src.dart';
import '../../../../generated/locales.g.dart';
import '../../../../shares/shares.src.dart';
import '../certificate_list.src.dart';

part 'certificate_list_view.dart';

class CertificateListPage extends BaseGetWidget<CertificateListController> {
  const CertificateListPage({Key? key}) : super(key: key);

  @override
  CertificateListController get controller =>
      Get.put(CertificateListController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: BackgroundAppBar.buildAppBar(
        controller.isVerifiedPage
            ? LocaleKeys.certification_list_certificationListTitle.tr
            : LocaleKeys.certification_list_listAuthProfile.tr,
      ),
      body: baseShowLoading(() => _body(controller)),
    );
  }
}
