import 'package:two_id_c06verify/base_app/base_app.src.dart';
import 'package:two_id_c06verify/core/base/base.src.dart';
import 'package:two_id_c06verify/core/core.src.dart';
import 'package:two_id_c06verify/modules/register_kyc_ca/service_package/service_package_src.dart';

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
