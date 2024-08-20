import 'package:two_id_c06verify/base_app/base_app.src.dart';
import 'package:two_id_c06verify/core/core.src.dart';
import 'package:two_id_c06verify/generated/locales.g.dart';
import 'package:two_id_c06verify/modules/home/home.src.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../shares/shares.src.dart';

class HomeController extends BaseGetxController {
  // late CertificateListRepository listCertRepository;
  RxInt unVerifiedCertCount = 0.obs;

  AppController appController = Get.find();

  Rx<Offset> position = Offset(Get.width - 80, Get.height / 1.4).obs;

  RxBool isTrash = false.obs;

  RxBool isShowSupportCus = true.obs;

  RxBool isBack = false.obs;

  Rx<TabItem> currentTab = TabItem.homePage.obs;


  @override
  void onInit() {
    // listCertRepository = CertificateListRepository(this);
    // if(appController.userInfoModel.status == AppConst.statusUserCreateNewApp){
    //   routerName(nameRouter: AppRoutes.routeChoosePackage);
    // }
    super.onInit();
    // getUnverifiedCertNumber();
  }

  // void getUnverifiedCertNumber() {
  //   listCertRepository
  //       .getCertificationList(EnumCertVerifyStatus.unVerified)
  //       .then(
  //     (response) {
  //       if (response.success == EnumStatusResponse.success) {
  //         unVerifiedCertCount.value = response.data.length;
  //       }
  //     },
  //   );
  // }
  funcPageChange(int index) {
    // pageIndex.value = index;
    currentTab.value = TabItem.values[index];
    // pageController.value.jumpToPage(index);
  }

  //TODO: add other logout actions
  Future<void> funcLogout() async {
    ShowDialog.showDialogConfirm(
      LocaleKeys.home_logoutConfirm.tr,
      cancelFunc: () => ShowDialog.dismissDialog(),
      confirm: () {
        appController.clearData(clearUserInfo: true);
        Get.offAllNamed(AppRoutes.routeLogin);
      },
      actionTitle: LocaleKeys.home_agree.tr,
    );
  }

  void fucItem(HomeItem item) {
    switch (item.code) {
      /// màn đăng ký cts
      case HomeCollection.codeCreateCert:
        fucCreateCert();
        break;
        /// màn ds chứng thư số
      case HomeCollection.codeViewListCTS:
        routerName(nameRouter: AppRoutes.routeCertificationList);
        break;
        ///xác thực hồ sơ
      case HomeCollection.codeViewListAuth:
        // truyen id user sang
        routerName(
          nameRouter: AppRoutes.routeVerifyProfile,
          arguments: appController.userInfoModel.id,
        );
        break;
    }
  }

  void fucCreateCert() {
    appController.configCertificateModel.isCreateCertificate = true;
    if (appController.userInfoModel.type == AppConst.typeRegularAccount) {
      routerName(
          nameRouter: AppRoutes.routeChoosePackage,
          fuc: () {
            appController.configCertificateModel.isCreateCertificate = false;
          });
    } else {
      routerName(
          nameRouter: AppRoutes.routeRegisterAccount,
          arguments: false,
          fuc: () {
            appController.configCertificateModel.isCreateCertificate = false;
          });
    }
  }

  /// Dùng để chuyển màn hình
  void routerName({
    required String nameRouter,
    dynamic arguments,
    Function? fuc,
  }) {
    Get.toNamed(nameRouter, arguments: arguments)?.then((value) => fuc?.call());
  }

  void setPositionChatBox(Offset offset) {
    position.value = offset;
    if (position.value.dx > Get.width - AppDimens.padding50) {
      position.value =
          Offset(Get.width - AppDimens.padding50, position.value.dy);
    }
    if (position.value.dy > Get.height - AppDimens.paddingPositionPhone) {
      position.value = Offset(
          position.value.dx, Get.height - AppDimens.paddingPositionPhone);
    }
    if (position.value.dx - AppDimens.padding50 <= 0) {
      position.value = Offset(1, position.value.dy);
    }
    if (position.value.dy - AppDimens.padding50 <= 0) {
      position.value = Offset(position.value.dx, 1);
    }
  }

  DateTime? _currentBackPressTime;

  Future<void> onWillPop() async {
    DateTime now = DateTime.now();
    if (_currentBackPressTime == null ||
        now.difference(_currentBackPressTime ?? DateTime.now()) >
            const Duration(seconds: 2)) {
      _currentBackPressTime = now;
      Fluttertoast.showToast(msg: LocaleKeys.home_tapExit.tr);
      isBack.value = false;
      // return Future.value(false);
    }
    isBack.value = true;
  }
}
