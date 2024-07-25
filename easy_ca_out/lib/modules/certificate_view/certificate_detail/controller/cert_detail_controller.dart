import 'package:easy_ca/base_app/base_app.src.dart';
import 'package:easy_ca/core/core.src.dart';
import 'package:easy_ca/shares/shares.src.dart';
import '../../../../generated/locales.g.dart';
import '../../certificate_view.src.dart';

class CertificateDetailController extends BaseGetxController {
  RxBool isConfirmedCheck = false.obs;
  late CertificateModel certificateInfo;
  late CertificateDetailRepository repository;

  @override
  void onInit() {
    repository = CertificateDetailRepository(this);
    if (Get.arguments != null && Get.arguments is CertificateModel) {
      certificateInfo = Get.arguments;
    }
    super.onInit();
  }

  void changeCheckboxConfirm(bool? value) {
    if (value != null) {
      isConfirmedCheck.value = value;
    }
  }

  Future<void> sendVerifyCert() async {
    if (isConfirmedCheck.value) {
      await repository
          .sendVerifyCertificate(
        SendVerifyCertModel(
          sessionId: certificateInfo.sessionId,
          verifyCertStatus: EnumCertVerifyStatus.verified,
          acceptTime: DateTime.now(),
          ip: getIdDevice(),
          device: getNameDevice(),
        ),
      )
          .then((res) {
        if (res.success == EnumStatusResponse.success) {
          Get.back(result: true);
        } else {
          showSnackBar(res.message);
        }
      });
    } else {
      showSnackBar(LocaleKeys.certification_detail_notConfirmWarning.tr);
    }
  }
}
