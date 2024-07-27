import 'package:authentication_kyc/base_app/base_app.src.dart';
import 'package:authentication_kyc/core/base/base.src.dart';
import 'package:authentication_kyc/core/core.src.dart';

class PdfRegistrationFormRepository extends BaseRepository {
  PdfRegistrationFormRepository(BaseGetxController controller)
      : super(controller);

  Future<BaseResponseBE> getPdf() async {
    String sessionId = hiveApp.get(AppKey.sessionId);
    // String sessionId = "c3129537-6a17-4280-96c9-71207196f798";

    Map<String, String> mapJson = {"sessionId": sessionId};

    var response = await baseCallApi(
      AppApi.getDataPdf,
      EnumRequestMethod.get,
      jsonMap: mapJson,
      isQueryParametersPost: true,
      isHaveVersion: false,
    );
    return BaseResponseBE.fromJson(response);
  }
}
