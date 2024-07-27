/// class chứa các giá trị không đổi quan trọng trong dự án
class AppConst {
  ///Độ dài giá trị tiền tối đa
  static const int currencyUtilsMaxLength = 12;

  static const int requestTimeOut = 15000; //ms

  ///type select date
  static const int typeDateOfBirth = 0;
  static const int typeDateIssue = 1;
  static const int typeDateOfExpiration = 2;

  ///time periodic
  static const int timePeriodic = 5;

  ///timeout kyc
  static const int timeoutKyc = 3;

  ///fileType send image
  static const String fileTypeFront = "ID_FRONT";
  static const String fileTypeBack = "ID_BACK";
  static const String fileTypeFace = "FACE";

  /// error const
  static const int error500 = 500;
  static const int error404 = 404;
  static const int error401 = 401;
  static const int error400 = 400;
  static const int error502 = 502;
  static const int error503 = 503;

  ///key CardAccessDataNFCIos
  static const String keyAccessDataNFCIos = "3134300d060804007f0007020202020101300f060a04007f000702020302020201013012060a04007f0007020204020202010202010d";

  ///status nfc
  static const String nfcAvailable = "nfc_available";
  static const String nfcDisabled = "nfc_disabled";
  static const String nfcDisabledNotSupported = "nfc_not_supported";

  ///max step live ness
  static const int currentStepMax = 5;

  ///type user
  static const int typeRegularAccount = 0; //tài khoản thường
  static const int typeAgentAccount = 1;//tài khoản đại lý

  ///status user
  static const int statusUserCreateNewApp = 0;
  static const int statusUserCreateCRM = 1;
  static const int statusUserCreateBE = 2;
  static const int statusUserCreateAPP = 3;

}
