import 'package:two_id_c06verify/modules/register_kyc_ca/service_package/service_package_src.dart';

class ConfigCertificateModel {
  ConfigCertificateModel({
    this.itemSelectPackage,
    this.isCreateCertificate = false,
  });

  bool isCreateCertificate; // true: Tạo mới chứng thư, false: xác thực hồ sơ hiện title thông báo
  PackageInfoResponse? itemSelectPackage;
}
