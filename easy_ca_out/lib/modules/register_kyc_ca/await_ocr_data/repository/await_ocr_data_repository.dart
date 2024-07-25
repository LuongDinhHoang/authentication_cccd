import 'package:easy_ca/base_app/base_app.src.dart';
import 'package:easy_ca/core/base/base.src.dart';
import 'package:easy_ca/core/core.src.dart';
import 'package:easy_ca/modules/register_kyc_ca/await_ocr_data/await_ocr_data.src.dart';

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
