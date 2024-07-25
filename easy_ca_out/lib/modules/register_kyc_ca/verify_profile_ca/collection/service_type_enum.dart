import 'package:easy_ca/generated/locales.g.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class ServiceTypeEnum {
  /// Cá nhân
  static const String personalService = "PERSONAL";

  /// Cá nhân doanh nghiệp
  static const String staffService = "STAFF";

  /// Doanh nghiệp
  static const String enterpriseService = "ENTERPRISE";

  /// Map chuyển key sang text
  static Map<String, String> mapServiceType = {
    personalService: LocaleKeys.packageService_personalService.tr,
    staffService: LocaleKeys.packageService_staffService.tr,
    enterpriseService: LocaleKeys.packageService_enterpriseService.tr,
  };
}
