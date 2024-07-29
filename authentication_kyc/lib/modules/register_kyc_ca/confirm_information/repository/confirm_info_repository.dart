import 'dart:typed_data';

import 'package:two_id_c06verify/base_app/base_app.src.dart';
import 'package:two_id_c06verify/core/base/model/base_response.dart';
import 'package:two_id_c06verify/core/core.src.dart';
import 'package:two_id_c06verify/modules/register_kyc_ca/confirm_information/models/file_signature_request_model.dart';
import 'package:two_id_c06verify/modules/register_kyc_ca/confirm_information/models/person_info_request_model.dart';

class ConfirmInfoRepository extends BaseRepository {
  ConfirmInfoRepository(BaseGetxController controller) : super(controller);

  /// Gửi ảnh chữ ký
  Future<BaseResponseBE> fileSignatureRepository(Uint8List byteSign) async {
    String sessionId = hiveApp.get(AppKey.sessionId);

    FileSignatureRequestModel fileSignatureRequestModel =
        FileSignatureRequestModel(sessionId: sessionId, file: byteSign);

    var response = await baseCallApi(
      AppApi.fileSign,
      EnumRequestMethod.post,
      jsonMap: fileSignatureRequestModel.toJson(),
      isHaveVersion: false,
    );
    return BaseResponseBE.fromJson(response);
  }

  /// Update trạng thái lưu trữ thông tin OCR của người dùng (2.13)
  Future<BaseResponseBE> updatePersonInfo(
      PersonInfoRequestModel personInfoRequestModel) async {
    var response = await baseCallApi(
      AppApi.updatePersonInfo,
      EnumRequestMethod.post,
      jsonMap: personInfoRequestModel.toJson(),
      isHaveVersion: false,
    );
    return BaseResponseBE.fromJson(response);
  }
}
