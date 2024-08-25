import 'package:two_id_c06verify/core/base/base.src.dart';
import 'package:two_id_c06verify/core/values/app_api.dart';

import '../../../../base_app/base_app.src.dart';
import '../../../../core/enum/enum_request_method.dart';
import '../../../../shares/shares.src.dart';

class ForgotPasswordRepository extends BaseRepository {
  ForgotPasswordRepository(BaseGetxController controller) : super(controller);

  Future<BaseResponseBE> forgotPassRepository(String newPassword) async {
    FormData formData = FormData.fromMap({
      "newPassword": newPassword,
      "secretKey": GetPlatform.isAndroid
          ? androidDeviceInfo?.id
          : iosDeviceInfo?.identifierForVendor
    });

    var response = await baseCallApi(
      AppApi.forgotPassWord,
      EnumRequestMethod.post,
      jsonMap: formData,
    );
    return BaseResponseBE.fromJson(
      response,
    );
  }
}
