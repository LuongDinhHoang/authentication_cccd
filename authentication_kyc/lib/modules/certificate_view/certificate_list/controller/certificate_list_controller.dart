import 'package:authentication_kyc/base_app/base_app.src.dart';
import 'package:authentication_kyc/core/core.src.dart';
import 'package:authentication_kyc/shares/package/export_package.dart';

import '../certificate_list.src.dart';

class CertificateListController extends BaseGetxController {
  bool isVerifiedPage = true;
  late CertificateListRepository repository;
  RxList<CertificateModel> listCert = <CertificateModel>[].obs;

  @override
  Future<void> onInit() async {
    showLoading();
    repository = CertificateListRepository(this);
    if (Get.arguments != null && Get.arguments is bool) {
      isVerifiedPage = Get.arguments;
    }
    await getListCert();
    hideLoading();
    super.onInit();
  }

  Future<void> getListCert() async {
    listCert.clear();
    await repository
        .getCertificationList(isVerifiedPage
            ? EnumCertVerifyStatus.verified
            : EnumCertVerifyStatus.unVerified)
        .then((response) {
      if (response.success == EnumStatusResponse.success) {
        listCert.addAll(response.data);
      }
    });
  }

}
