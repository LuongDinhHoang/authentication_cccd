import 'package:two_id_c06verify/base_app/controllers_base/base_controller/base_controller.dart';
import 'package:two_id_c06verify/base_app/repository_base/base_repository.dart';
import 'package:two_id_c06verify/core/base/base.src.dart';
import 'package:two_id_c06verify/core/values/app_api.dart';
import 'package:two_id_c06verify/modules/register_info/register_info.src.dart';

import '../../../../core/enum/enum_request_method.dart';

class RegisterRepository extends BaseRepository {
  RegisterRepository(BaseGetxController controller) : super(controller);

  Future<BaseResponseBE> registerRepository(
      RegisterRequestModel registerRequestModel) async {
    var response = await baseCallApi(
      AppApi.getRegister,
      EnumRequestMethod.post,
      jsonMap: registerRequestModel.toJson(),
    );
    return BaseResponseBE.fromJson(
      response,
    );
  }
}
