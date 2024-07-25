import 'package:easy_ca/base_app/base_app.src.dart';
import 'package:easy_ca/core/base/base.src.dart';
import 'package:easy_ca/core/core.src.dart';
import 'package:easy_ca/modules/register_kyc_ca/service_package/service_package_src.dart';

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
