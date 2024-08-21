import 'package:two_id_c06verify/base_app/base_app.src.dart';
import 'package:two_id_c06verify/core/base/base.src.dart';
import 'package:two_id_c06verify/core/core.src.dart';
import 'package:two_id_c06verify/generated/locales.g.dart';
import 'package:two_id_c06verify/modules/register_kyc_ca/verify_profile_ca/controllers/login_ca_controller.dart';
import 'package:two_id_c06verify/modules/register_kyc_ca/verify_profile_ca/repository/login_ca_repository.dart';
import 'package:two_id_c06verify/modules/register_kyc_ca/verify_profile_ca/verify_profile_ca_src.dart';
import 'package:two_id_c06verify/shares/shares.src.dart';
import 'package:two_id_c06verify/shares/utils/time/date_utils.dart';
import 'package:flutter/material.dart';

class VerifyProfileController extends BaseGetxController
    with LoginCaController {
  TextEditingController textUserName = TextEditingController();
  TextEditingController textPassword = TextEditingController();

  final Rx<FocusNode> userNameFocus = FocusNode().obs;
  final Rx<FocusNode> passwordFocus = FocusNode().obs;

  final Rx<Color> fillColorUserName = AppColors.basicWhite.obs;
  final Rx<Color> fillColorPassword = AppColors.basicWhite.obs;

  RxBool isRememberLogin = false.obs;

  RxInt currentPageIndex = 0.obs;

  late PageController pageViewController;

  RxBool isPermission = false.obs;

  late LoginCaRepository loginCaRepository;

  late AuthProfileRepository authProfileRepository;

  RxList<AuthProfileResponseModel> listAuthProfileModel =
      <AuthProfileResponseModel>[].obs;

  int uIdCa = 0;

  RxInt indexListAuth = 0.obs;

  final formKey = GlobalKey<FormState>();
  AppController appController = Get.find<AppController>();

  late bool isLoginCa = true; // true la can man login

  @override
  Future<void> onInit() async {
    if (Get.arguments != null) {
      isLoginCa = false;
      uIdCa = Get.arguments;
    }
    loginCaRepository = LoginCaRepository(this);
    authProfileRepository = AuthProfileRepository(this);
    if (isLoginCa) {
      initText();
      pageViewController = PageController(initialPage: 0);
    } else {
      pageViewController = PageController(initialPage: 1);
      currentPageIndex.value = 1;
      await getAuthProfile();
    }

    super.onInit();
  }

  void initText() {
    initTextEditing(this);
    initTextHive(this);
  }

  void handlePageViewChanged(int page) {
    currentPageIndex.value = page;
  }

  void funcLeadingBack() {
    if (currentPageIndex.value == 1 && isLoginCa) {
      currentPageIndex.value = 0;
      pageViewController.animateToPage(currentPageIndex.value,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
      // clean lại lưa chọn
      cleanController();
    } else {
      Get.back();
    }
  }

  Color getColorButton() {
    return isPermission.value && listAuthProfileModel.isNotEmpty
        ? AppColors.primaryBlue1
        : AppColors.basicGrey3;
  }

  /// Clean lại lựa chọn khi back
  void cleanController() {
    isPermission.value = false;
    indexListAuth.value = (0);
  }

  // /// Lấy tên thiết bị điện thoại
  // String getNameDevice() {
  //   String nameDevice = "";
  //   if (iosDeviceInfo != null) {
  //     nameDevice = iosDeviceInfo!.utsname.machine;
  //   } else {
  //     nameDevice = androidDeviceInfo!.model;
  //   }
  //   return nameDevice;
  // }
  //
  // /// Lấy id điện thoại
  // String getIdDevice() {
  //   String idDevice = "";
  //   if (iosDeviceInfo != null) {
  //     idDevice = iosDeviceInfo!.identifierForVendor.toString();
  //   } else {
  //     idDevice = androidDeviceInfo!.id;
  //   }
  //   return idDevice;
  // }

  /// Chấp nhận điều khoản
  Future<void> appAcceptTerms() async {
    AuthProfileResponseModel authProfileModel =
        listAuthProfileModel[indexListAuth.value];

    AuthProfileRequestModel authProfileRequestModel = AuthProfileRequestModel(
      sessionId: authProfileModel.sessionId,
      policyStatus: "OK",
      acceptTime: convertDateToString(DateTime.now(), pattern5),
      device: getNameDevice(),
      ip: getIdDevice(),
    );

    try {
      // showLoading();
      // BaseResponseBE baseResponseBE =
      //     await authProfileRepository.acceptTerms(authProfileRequestModel);
      // if (baseResponseBE.success == EnumStatusResponse.success) {
      //   hiveApp.put(AppKey.sessionId, authProfileRequestModel.sessionId);
      //   await getToUpdatePhotoInfo(authProfileModel);
      //   // Get.toNamed(AppRoutes.routeConfirmInformation);
      // } else {
      //   showSnackBar(baseResponseBE.message);
      // }
    } catch (e) {
      showSnackBar(LocaleKeys.errorApi_errorException.tr);
    }
  }

  Future<void> getAuthProfile() async {
    try {
      showLoadingOverlay();
      BaseResponseListBE<AuthProfileResponseModel> baseResponseBE =
          await authProfileRepository.getListAuthProfile(uIdCa);
      if (baseResponseBE.success == EnumStatusResponse.success) {
        if (baseResponseBE.data.isNotEmpty) {
          listAuthProfileModel.addAll(baseResponseBE.data);
          if (isLoginCa) {
            pageViewController.animateToPage(1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
          }
        } else {
          if (isLoginCa) {
            pageViewController.animateToPage(1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
          }
        }
        // else {
        //   if (isLoginCa) {
        //     Get.offAllNamed(AppRoutes.routeHome);
        //   }
        // }
      } else {
        showSnackBar(baseResponseBE.message);
      }
    } catch (e) {
      showSnackBar(LocaleKeys.errorApi_errorException.tr);
    } finally {
      hideLoadingOverlay();
    }
  }

  Future<void> getToUpdatePhotoInfo(
      AuthProfileResponseModel authProfileModel) async {
    appController.authProfileRequestModel = authProfileModel;
    // Get.toNamed(AppRoutes.routeScanNfcKyc);

    Get.toNamed(AppRoutes.routeAuthenticationGuide);

    // PermissionStatus permissionStatus =
    //     await checkPermission([Permission.camera]);
    // switch (permissionStatus) {
    //   case PermissionStatus.granted:
    //     {
    //       await appController.initCamera();
    //       appController.authProfileRequestModel = authProfileModel;
    //       Get.toNamed(AppRoutes.routeUpdatePhoToInformationKyc,
    //           arguments: authProfileModel);
    //     }
    //     break;
    //   case PermissionStatus.permanentlyDenied:
    //     ShowDialog.openAppSetting();
    //     break;
    //   default:
    //     return;
    // }
  }

  String nameServicePackage(String serviceType, String serviceExpiry) {
    return "$serviceType $serviceExpiry ${LocaleKeys.registerCa_month.tr}";
  }

  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
