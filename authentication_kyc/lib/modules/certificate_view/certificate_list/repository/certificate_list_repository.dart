import '../../../../base_app/base_app.src.dart';
import '../../../../core/base/model/base_list_response.dart';
import '../../../../core/core.src.dart';
import '../certificate_list.src.dart';

class CertificateListRepository extends BaseRepository {
  CertificateListRepository(BaseGetxController controller) : super(controller);

  Future<BaseResponseListBE<CertificateModel>> getCertificationList(
      int status) async {
    var response = await baseCallApi(
      AppApi.getCertVerifyStatus(status),
      EnumRequestMethod.get,
      isHaveVersion: false,
    );
    return BaseResponseListBE<CertificateModel>.fromJson(
      response,
      (x) => CertificateModel.fromJson(x),
    );
  }
}
