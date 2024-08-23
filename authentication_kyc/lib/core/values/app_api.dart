/// class chứa các api để giao tiếp với BE
// Todo: AppUrl
class AppApi {
  static const String url = 'https://uat-api-c06verify.2id.vn/api';
  static const String version = "?v=1.0";
  static const String loginApp = "/v1/auth/customer/login";
  static const String sendLiveNessData = "/live-ness-data/sendLiveNessData";
  static const String getAuthProfile = "/certificate-orders/list-auth-request";
  static const String sendNfcData = "/nfc-data/sendNFCData";
  static const String getDataORC = "/ocr-data/get-ocr";
  static const String sendFileOCR = "/files/send-file";
  static const String getUserInfo= "/v1/customers/me";
  static const String getPackagesDefault= "/customer-config/packages/default";
  static const String getRegister = "/v1/auth/customer/register";

  static const String acceptTerms = "/certificate-orders/sendPolicyAgreement";
  static const String registerAccount = "/account/register";
  static const String registerCertificate = "/certificate-orders/register-certificate-order";
  static const String packageService = "/system-config/packages";

  static const String fileSign = "/certificate-orders/send-sign-image";
  static const String getDataPdf =
      "/certificate-orders/get-certificate-register";

  static String getCertVerifyStatus(int status) {
    return "/certificate-orders/get-certificate-info-by-status?status=$status";
  }

  static const String sendVerifyCertification =
      "/certificate-orders/send-certificate-verify-status";
  static const String updatePersonInfo = "/ocr-data/client-register";
}
