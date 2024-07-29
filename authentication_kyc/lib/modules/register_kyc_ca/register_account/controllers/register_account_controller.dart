import 'package:two_id_c06verify/assets.dart';
import 'package:two_id_c06verify/base_app/base_app.src.dart';
import 'package:two_id_c06verify/core/base/base.src.dart';
import 'package:two_id_c06verify/core/core.src.dart';
import 'package:two_id_c06verify/generated/locales.g.dart';
import 'package:two_id_c06verify/modules/login/login.src.dart';
import 'package:two_id_c06verify/modules/register_kyc_ca/register_account/register_account_src.dart';
import 'package:two_id_c06verify/modules/register_kyc_ca/service_package/service_package_src.dart';
import 'package:two_id_c06verify/modules/register_kyc_ca/verify_profile_ca/verify_profile_ca_src.dart';
import 'package:two_id_c06verify/shares/shares.src.dart';
import 'package:two_id_c06verify/shares/utils/time/date_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterAccountController extends BaseGetxController {
  final TextEditingController textEditService = TextEditingController();

  final TextEditingController textEditIdNumber = TextEditingController();

  final TextEditingController textEditNumberPhone = TextEditingController();

  final TextEditingController textEditEmail = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final Rx<FocusNode> idNumberFocus = FocusNode().obs;

  final Rx<FocusNode> serviceFocus = FocusNode().obs;

  final Rx<FocusNode> numberPhoneFocus = FocusNode().obs;

  final Rx<FocusNode> emailFocus = FocusNode().obs;

  RxBool isPermission = false.obs;

  late bool isVerifyProfile; // false: đăng ký, true: xác nhận thông tin

  late RegisterAccountRepository registerAccountRepository;

  AppController appController = Get.find();

  late AuthProfileRepository authProfileRepository;

  bool enableTextInput = true;

  @override
  void onInit() {
    isVerifyProfile = Get.arguments;
    authProfileRepository = AuthProfileRepository(this);
    enableTextInput =
        appController.userInfoModel.type != AppConst.typeRegularAccount;
    fillDataInfo();
    registerAccountRepository = RegisterAccountRepository(this);
    if (appController.userInfoModel.type == AppConst.typeAgentAccount) {
      registerAccountRepository.getPackageDefault().then((value) {
        if (value.success == EnumStatusResponse.success) {
          appController.configCertificateModel.itemSelectPackage =
              value.data ?? PackageInfoResponse();
          textEditService.text = value.data?.serviceName ?? "";
        }
      });
    } else if (appController.userInfoModel.type ==
        AppConst.typeRegularAccount) {
      textEditService.text =
          appController.configCertificateModel.itemSelectPackage?.serviceName ??
              "";
    }
    super.onInit();
  }

  void fillDataInfo() {
    if (!isVerifyProfile &&
        appController.userInfoModel.type == AppConst.typeRegularAccount) {
      final UserInfoModel userInfoModel = appController.userInfoModel;
      textEditEmail.text = userInfoModel.email ?? "";
      textEditNumberPhone.text = userInfoModel.phone ?? "";
      textEditIdNumber.text = userInfoModel.documentNumber ?? "";
    }
  }

  String getTitle() {
    return isVerifyProfile
        ? LocaleKeys.register_account_information_account.tr
        : LocaleKeys.register_account_customerInformation.tr;
  }

  Future<void> createAccount() async {
    final AccountInformationModel accountInformationModel =
        AccountInformationModel(
      idCard: textEditIdNumber.text.trim(),
      email: textEditEmail.text.trim(),
      numberPhone: textEditNumberPhone.text,
    );

    try {
      showLoading();
      BaseResponseBE baseResponseBE = await registerAccountRepository
          .createAccount(accountInformationModel);
      if (baseResponseBE.success == EnumStatusResponse.success) {
        final loginController = Get.find<LoginController>();
        loginController.userNameController.text = textEditIdNumber.text;
        loginController.passwordController.text = "";
        Get.until((route) => route.settings.name == AppRoutes.routeLogin);
        await Future.delayed(const Duration(milliseconds: 500));
        ShowDialog.dialogBase(
            icon: SvgPicture.asset(
              Assets.ASSETS_SVG_ICON_EMAIL_SVG,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryCam1,
                BlendMode.srcIn,
              ),
            ),
            titleButton: LocaleKeys.dialog_close.tr,
            title: LocaleKeys.dialog_notify.tr,
            content: LocaleKeys.authentication_guide_sign_up_success.tr,
            function: () {
              if (Get.isDialogOpen ?? false) {
                Get.back();
              }
            });
      } else {
        showSnackBar(baseResponseBE.message);
      }
    } catch (e) {
      showSnackBar(LocaleKeys.errorApi_errorException.tr);
    } finally {
      hideLoading();
    }
  }

  Future<void> getSessionUser() async {
    try {
      UserInfoModel userInfoModelRepository = UserInfoModel(
        email: textEditEmail.text,
        documentNumber: textEditIdNumber.text,
        phone: textEditNumberPhone.text,
      );
      showLoading();
      await registerAccountRepository
          .getSessionUser(
        userInfoModel: userInfoModelRepository,
        packageInfoResponse:
            (appController.configCertificateModel.itemSelectPackage) ??
                PackageInfoResponse(),
      )
          .then((value) {
        if (value.success == EnumStatusResponse.success) {
          hiveApp.put(AppKey.sessionId, value.data);
          appController.authProfileRequestModel.identity =
              textEditIdNumber.text;
          appAcceptTerms();
          // /// Chuyển thành true để hiển thị package
          // appController.packageInfoSelectItem.isSelectPackage = true;
          Get.toNamed(AppRoutes.routeAuthenticationGuide);
        } else {
          showSnackBar(value.message);
        }
      });
    } catch (e) {
      showSnackBar(LocaleKeys.errorApi_errorException.tr);
    } finally {
      hideLoading();
    }
  }

  /// Chấp nhận điều khoản
  Future<void> appAcceptTerms() async {
    String sessionId = hiveApp.get(AppKey.sessionId);

    AuthProfileRequestModel authProfileRequestModel = AuthProfileRequestModel(
      sessionId: sessionId,
      policyStatus: "OK",
      acceptTime: convertDateToString(DateTime.now(), pattern5),
      device: getNameDevice(),
      ip: getIdDevice(),
    );

    await authProfileRepository.acceptTerms(authProfileRequestModel);
  }
}
