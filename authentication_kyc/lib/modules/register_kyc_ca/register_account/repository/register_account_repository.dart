import 'package:two_id_c06verify/base_app/controllers_base/base_controller/base_controller.dart';
import 'package:two_id_c06verify/base_app/repository_base/repository_base.src.dart';
import 'package:two_id_c06verify/core/base/base.src.dart';
import 'package:two_id_c06verify/core/core.src.dart';
import 'package:two_id_c06verify/modules/login/login.src.dart';
import 'package:two_id_c06verify/modules/register_kyc_ca/register_account/register_account_src.dart';
import 'package:two_id_c06verify/modules/register_kyc_ca/service_package/service_package_src.dart';

class RegisterAccountRepository extends BaseRepository {
  RegisterAccountRepository(BaseGetxController controller) : super(controller);

  Future<BaseResponseBE> createAccount(
      AccountInformationModel accountInformationModel) async {
    var response = await baseCallApi(
      AppApi.registerAccount,
      EnumRequestMethod.post,
      jsonMap: accountInformationModel.toJson(),
      isHaveVersion: false,
      isToken: false,
    );
    return BaseResponseBE.fromJson(response);
  }

  Future<BaseResponseBE> getSessionUser({
    required UserInfoModel userInfoModel,
    required PackageInfoResponse packageInfoResponse,
  }) async {
    final Map<String, String> jsonBody = {
      "certType": packageInfoResponse.certType ?? "",
      "expiry": packageInfoResponse.expiry.toString(),
      "serviceName": packageInfoResponse.serviceName ?? "",
      "tokenType": packageInfoResponse.tokenType ?? "",
      "email": userInfoModel.email ?? "",
      // "identity": userInfoModel.documentNumber ?? "",
      "phone": userInfoModel.phone ?? "",
      "registerType": "NEW",
    };

    var response = await baseCallApi(
      AppApi.registerCertificate,
      EnumRequestMethod.post,
      jsonMap: jsonBody,
      isHaveVersion: false,
    );
    return BaseResponseBE.fromJson(response);
  }

  Future<BaseResponseBE<PackageInfoResponse>> getPackageDefault() async {
    var response = await baseCallApi(
      AppApi.getPackagesDefault,
      EnumRequestMethod.get,
      isHaveVersion: false,
    );
    return BaseResponseBE.fromJson(
      response,
      func: (x) => PackageInfoResponse.fromJson(x),
    );
  }
}
