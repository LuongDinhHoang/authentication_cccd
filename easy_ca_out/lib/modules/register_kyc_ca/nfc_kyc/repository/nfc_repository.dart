import 'package:dio/dio.dart';
import 'package:easy_ca/base_app/base_app.src.dart';
import 'package:easy_ca/core/base/base.src.dart';
import 'package:easy_ca/core/core.src.dart';
import 'package:easy_ca/modules/register_kyc_ca/live_ness/live_ness_kyc.src.dart';
import 'package:easy_ca/modules/register_kyc_ca/nfc_kyc/nfc_kyc.src.dart';

class NfcRepository extends BaseRepository {
  NfcRepository(BaseGetxController controller) : super(controller);

  Future<BaseResponseBE> sendNfcRepository(
      SendNfcRequestModel sendNfcRequestModel) async {
    var response = await baseCallApi(
      AppApi.sendNfcData,
      EnumRequestMethod.post,
      jsonMap: sendNfcRequestModel.toJson(),
      isHaveVersion: false,
    );
    return BaseResponseBE.fromJson(response);
  }

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
}
