import 'package:authentication_kyc/base_app/controllers_base/base_controller/base_controller.dart';
import 'package:authentication_kyc/base_app/repository_base/base_repository.dart';
import 'package:authentication_kyc/core/base/base.src.dart';
import 'package:authentication_kyc/core/values/app_api.dart';
import 'package:authentication_kyc/modules/login/login.src.dart';

import '../../../../core/enum/enum_request_method.dart';
import '../verify_profile_ca_src.dart';

class LoginCaRepository extends BaseRepository {
  LoginCaRepository(BaseGetxController controller) : super(controller);

  Future<BaseResponseBE<LoginCaResponseModel>> loginCaRepository(
      LoginCaRequestModel loginCaRequestModel) async {
    var response = await baseCallApi(AppApi.loginCa, EnumRequestMethod.post,
        jsonMap: loginCaRequestModel.toJson(),
        isHaveVersion: false,
        isToken: false);
    return BaseResponseBE.fromJson(
      response,
      func: (x) => LoginCaResponseModel.fromJson(x),
    );
  }

  Future<BaseResponseBE<UserInfoModel>> getUserInfo() async {
    var response = await baseCallApi(
      AppApi.getUserInfo,
      EnumRequestMethod.get,
      isHaveVersion: false,
    );
    return BaseResponseBE.fromJson(
      response,
      func: (x) => UserInfoModel.fromJson(x),
    );
  }
}
