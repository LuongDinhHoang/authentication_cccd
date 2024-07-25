import 'package:dio/dio.dart';
import 'package:easy_ca/base_app/base_app.src.dart';
import 'package:easy_ca/base_app/controllers_base/base_controller/base_controller.dart';
import 'package:easy_ca/base_app/repository_base/base_repository.dart';
import 'package:easy_ca/core/base/base.src.dart';
import 'package:easy_ca/core/core.src.dart';
import 'package:easy_ca/core/values/app_api.dart';
import 'package:easy_ca/modules/register_kyc_ca/live_ness/live_ness_kyc.src.dart';
import 'package:easy_ca/modules/register_kyc_ca/update_photo_information_kyc/update_photo_information_kyc.src.dart';

import '../../../../core/enum/enum_request_method.dart';

class LiveNessRepository extends BaseRepository {
  LiveNessRepository(BaseGetxController controller) : super(controller);

  Future<BaseResponseBE> sendLiveNessRepository(
      LiveNessRequestModel liveNessRequestModel) async {
    FormData formData = FormData.fromMap(await liveNessRequestModel.toJson());
    var response = await baseCallApi(
      AppApi.sendLiveNessData,
      EnumRequestMethod.post,
      jsonMap: formData,
      isHaveVersion: false,
    );
    return BaseResponseBE.fromJson(response);
  }

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
