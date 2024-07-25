import 'package:easy_ca/base_app/views_base/base_widget.dart';
import 'package:easy_ca/shares/utils/time/date_utils.dart';
import 'package:easy_ca/shares/widgets/text/font_style.dart';
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
