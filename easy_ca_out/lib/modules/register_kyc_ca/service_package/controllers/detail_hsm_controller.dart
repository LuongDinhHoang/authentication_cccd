import 'package:easy_ca/base_app/base_app.src.dart';
import 'package:easy_ca/core/core.src.dart';
import 'package:easy_ca/generated/locales.g.dart';
import 'package:easy_ca/modules/register_kyc_ca/register_account/register_account_src.dart';
import 'package:easy_ca/modules/register_kyc_ca/service_package/service_package_src.dart';
import 'package:easy_ca/modules/register_kyc_ca/verify_profile_ca/verify_profile_ca_src.dart';
import 'package:easy_ca/shares/package/export_package.dart';
import 'package:flutter/material.dart';

class DetailHsmController extends BaseGetxController {
  List<PackageInfoResponse> listDetailHSM = [];

  RxInt indexHsm = (-1).obs;

  AppController appController = Get.find();

  @override
  void onInit() {
    // initService();
    listDetailHSM = Get.arguments;
    super.onInit();
  }

  void setDataPackageInfo() {
    if(indexHsm.value != -1){
      appController.configCertificateModel.itemSelectPackage =
          listDetailHSM[indexHsm.value];
      if (Get.isRegistered<RegisterAccountController>()) {
        final RegisterAccountController registerAccountController =
            Get.find<RegisterAccountController>();
        registerAccountController.textEditService.text =
            listDetailHSM[indexHsm.value].serviceName ?? "";
        Get.until(
            (route) => route.settings.name == AppRoutes.routeRegisterAccount);
      } else {
        Get.toNamed(AppRoutes.routeRegisterAccount, arguments: false);
      }
    }

  }

  String nameServicePackage(String serviceType, int serviceExpiry) {
    String typePackage = ServiceTypeEnum.mapServiceType[serviceType] ?? "";

    return "Gói $typePackage $serviceExpiry ${LocaleKeys.registerCa_month.tr}";
  }

  Color getColorBorderSelect(int index) {
    return index == indexHsm.value
        ? AppColors.primaryCam1
        : AppColors.basicWhite;
  }

  Color getColorBackgroundSelect(int index) {
    return index == indexHsm.value
        ? AppColors.secondaryCamPastel2
        : AppColors.basicWhite;
  }

  Color getColorButton() {
    return indexHsm.value != -1 ? AppColors.primaryCam1 : AppColors.basicGrey3;
  }
}
