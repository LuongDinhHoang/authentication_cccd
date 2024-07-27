import 'package:authentication_kyc/base_app/base_app.src.dart';
import 'package:authentication_kyc/core/base/base.src.dart';
import 'package:authentication_kyc/core/core.src.dart';
import 'package:authentication_kyc/modules/register_kyc_ca/update_photo_information_kyc/update_photo_information_kyc.src.dart';

class UpdatePhotoInformationRepository extends BaseRepository {
  UpdatePhotoInformationRepository(BaseGetxController controller)
      : super(controller);

  Future<BaseResponseBE> sendFileOCR({
    required List<FilesImageModel> listFile,
  }) async {
    Map<String, dynamic> jsonMap = {
      "session_id": hiveApp.get(AppKey.sessionId),
      "files": _getListFile(listFile),
    };
    var response = await baseCallApi(
      AppApi.sendFileOCR,
      EnumRequestMethod.post,
      jsonMap: jsonMap,
      isHaveVersion: false,
    );
    return BaseResponseBE.fromJson(
      response,
    );
  }

  List<Map<String, String>> _getListFile(List<FilesImageModel> listFile) {
    return listFile.map((obj) => obj.toJson()).toList();
  }
}
