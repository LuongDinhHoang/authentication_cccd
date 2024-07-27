import 'package:authentication_kyc/base_app/base_app.src.dart';
import 'package:authentication_kyc/core/base/base.src.dart';
import 'package:authentication_kyc/core/core.src.dart';
import 'package:authentication_kyc/modules/register_kyc_ca/service_package/service_package_src.dart';

class PackageServiceRepository extends BaseRepository {
  PackageServiceRepository(BaseGetxController controller) : super(controller);

  Future<BaseResponseListBE<PackageInfoResponse>> getPackagesService() async {
    var response = await baseCallApi(
      AppApi.packageService,
      EnumRequestMethod.get,
      isHaveVersion: false,
    );

    return BaseResponseListBE<PackageInfoResponse>.fromJson(
      response,
      (x) => PackageInfoResponse.fromJson(x),
    );
  }
}
