import 'package:authentication_kyc/base_app/base_app.src.dart';
import 'package:authentication_kyc/core/base/base.src.dart';
import 'package:authentication_kyc/core/base/model/base_list_response.dart';
import 'package:authentication_kyc/core/core.src.dart';

import '../verify_profile_ca_src.dart';

class AuthProfileRepository extends BaseRepository {
  AuthProfileRepository(BaseGetxController controller) : super(controller);

  /// Lấy danh sách tài khoản
  Future<BaseResponseListBE<AuthProfileResponseModel>> getListAuthProfile(
      int uId) async {
    Map<String, int> mapParams = {"userId": uId};
    var response = await baseCallApi(
      AppApi.getAuthProfile,
      EnumRequestMethod.get,
      jsonMap: mapParams,
      isQueryParametersPost: true,
      isHaveVersion: false,
    );
    return BaseResponseListBE<AuthProfileResponseModel>.fromJson(
      response,
      (x) => AuthProfileResponseModel.fromJson(x),
    );
  }

  Future<BaseResponseBE> acceptTerms(
      AuthProfileRequestModel authProfileRequestModel) async {
    var response = await baseCallApi(
      AppApi.acceptTerms,
      EnumRequestMethod.post,
      jsonMap: authProfileRequestModel.toJson(),
      isHaveVersion: false,
    );
    return BaseResponseBE.fromJson(response);
  }
}
