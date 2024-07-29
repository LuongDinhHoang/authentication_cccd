import 'package:two_id_c06verify/base_app/base_app.src.dart';
import 'package:two_id_c06verify/core/base/base.src.dart';
import 'package:two_id_c06verify/core/core.src.dart';
import 'package:two_id_c06verify/modules/register_kyc_ca/await_ocr_data/await_ocr_data.src.dart';

class AwaitOcrDataRepository extends BaseRepository {
  AwaitOcrDataRepository(BaseGetxController controller) : super(controller);

  Future<BaseResponseBE<OCRDataModel>> getORCRepository() async {
    final Map<String, dynamic> jsonBody = {
      "sessionId": hiveApp.get(AppKey.sessionId),
    };
    var response = await baseCallApi(
      AppApi.getDataORC,
      EnumRequestMethod.get,
      isHaveVersion: false,
      jsonMap: jsonBody,
      timeOut: Duration.zero,
    );
    return BaseResponseBE.fromJson(
      response,
      func: (x) => OCRDataModel.fromJson(x),
    );
  }
}
