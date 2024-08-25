import 'package:two_id_c06verify/base_app/base_app.src.dart';
import 'package:two_id_c06verify/core/base/base.src.dart';
import 'package:two_id_c06verify/core/core.src.dart';
import 'package:two_id_c06verify/modules/register_kyc_ca/nfc_kyc/nfc_kyc.src.dart';

class NfcRepository extends BaseRepository {
  NfcRepository(BaseGetxController controller) : super(controller);

  Future<BaseResponseBE> sendNfcRepository(
      SendNfcRequestModel sendNfcRequestModel) async {
    var response = await baseCallApi(
      AppApi.sendNfcData,
      EnumRequestMethod.post,
      jsonMap: sendNfcRequestModel.toJsonBase64(),
      isHaveVersion: false,
    );
    return BaseResponseBE.fromJson(response);
  }
}
