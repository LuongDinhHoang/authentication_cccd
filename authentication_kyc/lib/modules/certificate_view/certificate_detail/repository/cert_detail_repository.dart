import 'package:two_id_c06verify/base_app/base_app.src.dart';
import 'package:two_id_c06verify/core/base/base.src.dart';
import 'package:two_id_c06verify/modules/certificate_view/certificate_detail/model/send_verify_cert_model.dart';

import '../../../../core/core.src.dart';

class CertificateDetailRepository extends BaseRepository {
  CertificateDetailRepository(BaseGetxController controller)
      : super(controller);

  Future<BaseResponseBE> sendVerifyCertificate(SendVerifyCertModel data) async {
    var response = await baseCallApi(
      AppApi.sendVerifyCertification,
      EnumRequestMethod.post,
      isHaveVersion: false,
      jsonMap: data.toJson(),
    );
    return BaseResponseBE.fromJson(response);
  }
}
