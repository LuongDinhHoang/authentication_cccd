import 'package:authentication_kyc/modules/home/home.src.dart';
import 'package:authentication_kyc/modules/login/views/login_page.dart';
import 'package:authentication_kyc/modules/register_kyc_ca/await_ocr_data/await_ocr_data.src.dart';
import 'package:authentication_kyc/modules/register_kyc_ca/confirm_information/views/confirm_information_page.dart';
import 'package:authentication_kyc/modules/register_kyc_ca/nfc_information_user/views/nfc_information_user_page.dart';
import 'package:authentication_kyc/modules/register_kyc_ca/live_ness/live_ness_kyc.src.dart';
import 'package:authentication_kyc/modules/register_kyc_ca/nfc_kyc/nfc_kyc.src.dart';
import 'package:authentication_kyc/modules/register_kyc_ca/pdf_registration_form_ca/views/pdf_registration_form_page.dart';
import 'package:authentication_kyc/modules/register_kyc_ca/qr_kyc/qr_kyc.src.dart';
import 'package:authentication_kyc/modules/register_kyc_ca/register_account/register_account_src.dart';
import 'package:authentication_kyc/modules/register_kyc_ca/scan_mrz/scan_mrz.src.dart';
import 'package:authentication_kyc/modules/register_kyc_ca/service_package/service_package_src.dart';
import 'package:authentication_kyc/modules/register_kyc_ca/take_picture_card_kyc/views/take_picture_card_kyc_page.dart';
import 'package:authentication_kyc/modules/register_kyc_ca/update_photo_information_kyc/update_photo_information_kyc.src.dart';
import 'package:authentication_kyc/modules/register_kyc_ca/verify_profile_ca/verify_profile_ca_src.dart';
import 'package:authentication_kyc/modules/terms_policies/terms_policies.src.dart';
import 'package:authentication_kyc/shares/shares.src.dart';

import '../../modules/certificate_view/certificate_view.src.dart';
import '../../modules/notification/notification.src.dart';
import '../../modules/splash/view/splash_page.dart';
import 'app_route.dart';

class RouteAppPage {
  static var route = [
    GetPage(
      name: AppRoutes.routeDioLog,
      page: () => const HttpLogListWidget(),
    ),
    GetPage(
      name: AppRoutes.initApp,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoutes.routeLogin,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: AppRoutes.routeRegisterCA,
      page: () => const RegisterServiceCAPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.routeUpdatePhoToInformationKyc,
      page: () => const UpdatePhotoInformationPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.routeDetailHsm,
      page: () => const DetailHsmPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.routeTakePictureCardKyc,
      page: () => const TakePictureCardKycPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.routeVerifyProfile,
      page: () => const VerifyProfilePage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.routeScanNfcKyc,
      page: () => const ScanNfcKycPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.routeConfirmInformation,
      page: () => const ConfirmInformationPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.routePdfRegistrationForm,
      page: () => const PdfRegistrationFormPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.routeLiveNessKyc,
      page: () => const LiveNessKycPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.routeInstructLiveNessKyc,
      page: () => const InstructLiveNessKycPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.routeNfcInformationUser,
      page: () => const NfcInformationUserPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.routeHome,
      page: () => const HomePage(),
    ),
    GetPage(
      name: AppRoutes.routeTermsAndPolicies,
      page: () => const TermsAndPoliciesPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.routeNotification,
      page: () => const NotificationPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.routeConfirmDigitalSign,
      page: () => const ConfirmDigitalSignPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
        name: AppRoutes.routeAwaitOCRData,
        page: () => const AwaitORCDataPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
        name: AppRoutes.routeCertificationList,
        page: () => const CertificateListPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
        name: AppRoutes.routeQrKyc,
        page: () => const QRGuidePage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.routeRegisterAccount,
      page: () => const RegisterAccountPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.routeChoosePackage,
      page: () => const ChoosePackagePage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.routeAuthenticationGuide,
      page: () => const AuthenticationGuidePage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.routeScanMRZ,
      page: () => const ScanMZRPage(),
      transition: Transition.rightToLeft,
    )
  ];
}
