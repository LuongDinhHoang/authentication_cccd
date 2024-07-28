import 'package:authentication_kyc/core/base/base.src.dart';
import 'package:authentication_kyc/modules/login/login.src.dart';
import 'package:authentication_kyc/modules/register_kyc_ca/verify_profile_ca/repository/login_ca_repository.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:local_auth/local_auth.dart';

import '../../../base_app/base_app.src.dart';
import '../../../core/core.src.dart';
import '../../../shares/shares.src.dart';
import '../../register_kyc_ca/verify_profile_ca/verify_profile_ca_src.dart';

class LoginController extends BaseGetxController {
  AppController appController = Get.find<AppController>();
  final formKeyReset = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final Rx<FocusNode> userNameFocus = FocusNode().obs;
  final Rx<FocusNode> passwordFocus = FocusNode().obs;
  final Rx<Color> fillColorUserName = AppColors.basicWhite.obs;
  final Rx<Color> fillColorPassword = AppColors.basicWhite.obs;
  final formKey = GlobalKey<FormState>();

  RxBool isShowTime = false.obs;
  RxString checkStatusNfc = "".obs;
  RxList<BiometricType> biometricTypes = RxList<BiometricType>();


  late LoginCaRepository loginCaRepository;

  @override
  Future<void> onInit() async {
    initText();
    initTextHive();
    biometricTypes.value = await Biometrics().getAvailableBiometrics() ?? [];
    loginCaRepository = LoginCaRepository(this);
    super.onInit();
  }

  void initText() {
    userNameFocus.value.addListener(() {
      if (userNameFocus.value.hasFocus) {
        fillColorUserName.value = AppColors.secondaryNavyPastel;
      } else {
        fillColorUserName.value = AppColors.basicWhite;
      }
    });
    passwordFocus.value.addListener(() {
      if (passwordFocus.value.hasFocus) {
        fillColorPassword.value = AppColors.secondaryNavyPastel;
      } else {
        fillColorPassword.value = AppColors.basicWhite;
      }
    });
    // textTaxCode.text = hiveApp.get(AppConst.textTaxCode) ?? "";
    // userNameController.text = hiveApp.get(AppConst.userName) ?? "";
    // passwordController.text = hiveApp.get(AppConst.password) ?? "";
  }
  Future<void> loginFingerprint({bool? autoBiometric}) async {
    // if (appController.isFingerprintOrFaceID.isTrue) {
      await Biometrics()
          .authenticate(
          localizedReasonStr: "Quý khách vui lòng quét vân tay hoặc khuôn mặt để xác thực",
          onDeviceUnlockUnavailable: () {
            Fluttertoast.showToast(
                msg: "Quý khách vui lòng thoát ứng dụng và đặt mật khẩu máy hoặc vân tay để dùng chức năng lưu mật khẩu!",
                toastLength: Toast.LENGTH_LONG);
          },
          onAfterLimit: () {
            Fluttertoast.showToast(
                msg: "Quý khách đã xác thực sai quá nhiều lần. Xin vui lòng thử lại sau!",
                toastLength: Toast.LENGTH_LONG);
          })
          .then((isAuthenticated) async {
        // if (isAuthenticated != null && isAuthenticated) {
        //   await appController.savePassword
        //       .read(AppKey.keyPass + HIVE_APP.get(AppKey.keyPhone))
        //       .then((result) {
        //     if (result.isNotEmpty) {
        //       passwordController.text = result;
        //       funcLogin();
        //     } else {
        //       showSnackBar(AppStr.notSavedAccount.tr);
        //     }
        //   });
        // } else {
        //   showSnackBar(AppStr.authenticationFailed.tr);
        // }
      });
    // } else if (!(autoBiometric ?? true)) {
    //   ShowPopup.showErrorMessage(biometricTypes.contains(BiometricType.face)
    //       ? AppStr.notSaveFaceID.tr
    //       : AppStr.notSaveFingerprint.tr);
    // }
  }


  Future<void> confirmLogin() async {
    // Get.toNamed(
    //   AppRoutes.routeQrKyc,
    // );
    bool isLoginSuccess = await loginResponse();
    if (isLoginSuccess) {
      Get.offAllNamed(
        AppRoutes.routeHome,
      );
      if (appController.userInfoModel.status ==
          AppConst.statusUserCreateNewApp) {
        Get.toNamed(AppRoutes.routeChoosePackage);
      }
    } else {
      hideLoading();
    }
  }

  Future<bool> loginResponse() async {
    bool isLoginSuccess = false;

    KeyBoard.hide();
    if (formKey.currentState?.validate() ?? false) {
      try {
        showLoading();
        LoginCaRequestModel loginCaRequestModel = LoginCaRequestModel(
          userName: userNameController.text.trim(),
          password: passwordController.text.trim(),
          isRememberMe: false,
        );
        BaseResponseBE baseResponseBE =
            await loginCaRepository.loginCaRepository(loginCaRequestModel);
        if (baseResponseBE.success == EnumStatusResponse.success) {
          LoginCaResponseModel loginCaResponseModel = baseResponseBE.data;
          hiveApp.put(AppKey.keyToken, "Bearer ${loginCaResponseModel.token}");
          isLoginSuccess = true;
          saveAccUser(loginCaRequestModel);
          await getUserInfo();
        } else {
          showSnackBar(baseResponseBE.message);
        }
      } catch (e) {
        // showSnackBar(LocaleKeys.registerCa_loginFalse.tr);
      } finally {
        hideLoading();
      }
    }
    return isLoginSuccess;
  }

  Future<void> getUserInfo() async {
    await loginCaRepository.getUserInfo().then((value) {
      if (value.success == EnumStatusResponse.success) {
        appController.userInfoModel = value.data ?? UserInfoModel();
      }
    });
  }

  void saveAccUser(LoginCaRequestModel loginCaRequestModel) {
    if (isRemember.isTrue) {
      loginCaRequestModel.isRememberMe = true;
      hiveUserLogin.put(AppKey.keyRememberLogin, loginCaRequestModel);
    } else {
      hiveUserLogin.clear();
    }
  }

  // Lấy dữ liệu từ hive về textEditing
  void initTextHive() {
    LoginCaRequestModel loginCaRequestModel =
        hiveUserLogin.get(AppKey.keyRememberLogin) ??
            LoginCaRequestModel(
              userName: "",
              password: "",
              isRememberMe: false,
            );
    userNameController.text = loginCaRequestModel.userName;
    passwordController.text = loginCaRequestModel.password;
    isRemember.value = loginCaRequestModel.isRememberMe;
  }
}
