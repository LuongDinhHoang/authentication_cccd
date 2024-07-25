import 'package:easy_ca/base_app/base_app.src.dart';
import 'package:easy_ca/core/base/base.src.dart';
import 'package:easy_ca/core/core.src.dart';
import 'package:easy_ca/generated/locales.g.dart';
import 'package:easy_ca/modules/register_kyc_ca/service_package/service_package_src.dart';
import 'package:easy_ca/shares/shares.src.dart';
import 'package:flutter/material.dart';

class ChoosePackageController extends BaseGetxController {
  List<PackageUiModel> listPackage = [];

  RxInt indexServiceCa = (-1).obs;

  RxInt currentPageIndex = 0.obs;

  RxBool isPolicyPrivacy = false.obs;

  late PackageServiceRepository packageServiceRepository;

  @override
  Future<void> onInit() async {
    packageServiceRepository = PackageServiceRepository(this);
    await getPackageService();
    super.onInit();
  }

  Future<void> getPackageService() async {
    try {
      showLoadingOverlay();
      BaseResponseListBE<PackageInfoResponse> baseResponseListBE =
          await packageServiceRepository.getPackagesService();

      if (baseResponseListBE.success == EnumStatusResponse.success) {
        ListPackageModel packageResponseModel =
            _categorizePackages(baseResponseListBE.data);
        _getTitle(packageResponseModel);
      }
    } finally {
      hideLoadingOverlay();
    }
  }

  ListPackageModel _categorizePackages(List<PackageInfoResponse> packages) {
    List<PackageInfoResponse> usbToken = [];
    List<PackageInfoResponse> hsm = [];
    List<PackageInfoResponse> remoteSigning = [];

    for (var item in packages) {
      switch (item.tokenType) {
        case PackageTitleEnum.packageUsbToken:
          usbToken.add(item);
          break;
        case PackageTitleEnum.packageHSM:
          hsm.add(item);
          break;
        case PackageTitleEnum.packageRemoteSigning:
          remoteSigning.add(item);
          break;
      }
    }

    return ListPackageModel(
      usbToken: usbToken,
      hsm: hsm,
      remoteSigning: remoteSigning,
    );
  }

  void _getTitle(ListPackageModel packageResponseModel) {
    if (packageResponseModel.usbToken.isNotEmpty) {
      listPackage.add(
        PackageUiModel(
          title: LocaleKeys.packageService_packageToken.tr,
          listPackage: packageResponseModel.usbToken,
        ),
      );
    }
    if (packageResponseModel.remoteSigning.isNotEmpty) {
      listPackage.add(
        PackageUiModel(
          title: LocaleKeys.packageService_packageRemoteSigning.tr,
          listPackage: packageResponseModel.remoteSigning,
        ),
      );
    }
    if (packageResponseModel.hsm.isNotEmpty) {
      listPackage.add(
        PackageUiModel(
          title: LocaleKeys.packageService_packageHsm.tr,
          listPackage: packageResponseModel.hsm,
        ),
      );
    }
  }

  Color getColorBorderSelect(int index) {
    return index == indexServiceCa.value
        ? AppColors.primaryCam1
        : AppColors.basicWhite;
  }

  Color getColorBackgroundSelect(int index) {
    return index == indexServiceCa.value
        ? AppColors.secondaryCamPastel2
        : AppColors.basicWhite;
  }

  Color getColorButton() {
    return indexServiceCa.value != -1
        ? AppColors.primaryCam1
        : AppColors.basicGrey3;
  }
}
