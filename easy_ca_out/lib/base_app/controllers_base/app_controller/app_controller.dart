import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_ca/base_app/base_app.src.dart';
import 'package:easy_ca/core/core.src.dart';
import 'package:easy_ca/firebase/firebase_src.dart';
import 'package:easy_ca/generated/locales.g.dart';
import 'package:easy_ca/hive_helper/hive_adapters.dart';
import 'package:easy_ca/hive_helper/register_adapters.dart';
import 'package:easy_ca/modules/login/login.src.dart';
import 'package:easy_ca/modules/register_kyc_ca/await_ocr_data/await_ocr_data.src.dart';
import 'package:easy_ca/modules/register_kyc_ca/nfc_kyc/nfc_kyc.src.dart';
import 'package:easy_ca/modules/register_kyc_ca/qr_kyc/qr_kyc.src.dart';
import 'package:easy_ca/modules/register_kyc_ca/service_package/service_package_src.dart';
import 'package:easy_ca/modules/register_kyc_ca/verify_profile_ca/models/authen_profile_model/auth_profile_model.src.dart';
import 'package:easy_ca/modules/register_kyc_ca/verify_profile_ca/models/login_ca_model/login_ca_request_model.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:upgrader/upgrader.dart';

late Box hiveApp;

late PackageInfo packageInfo;

IosDeviceInfo? iosDeviceInfo;

AndroidDeviceInfo? androidDeviceInfo;

late Box<LoginCaRequestModel> hiveUserLogin;

late Upgrader upgrade;

class AppController extends GetxController {
  RxBool isBusinessHousehold = false.obs;
  late List<CameraDescription> cameras;
  late CameraController cameraController;
  AuthProfileResponseModel authProfileRequestModel = AuthProfileResponseModel();
  OCRDataModel infoORCRequest = OCRDataModel();
  QrUserInformation qrUserInformation = QrUserInformation();
  SendNfcRequestModel sendNfcRequestGlobalModel = SendNfcRequestModel();
  UserInfoModel userInfoModel = UserInfoModel();

  Timer? timer;

  // PackageInfoResponse packageInfoResponse = PackageInfoResponse();

  ConfigCertificateModel configCertificateModel = ConfigCertificateModel();

  @override
  Future<void> onInit() async {
    initHive().then((value) async {
      await initConfig();
      Get.put(BaseApi(), permanent: true);
      try {
        // LoginController loginController = Get.put(LoginController());
        // await loginController.loginUserFromLogin(
        //     LoginModelRequest(
        //       username: hiveApp.get(AppConst.userName),
        //       password: hiveApp.get(AppConst.password),
        //     ),
        //     isLoginFromApp:
        //         true);
        Get.offAndToNamed(AppRoutes.routeLogin);
      } catch (e) {
        Get.offAndToNamed(AppRoutes.routeLogin);
      }
    });
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isIOS) {
      iosDeviceInfo = await deviceInfoPlugin.iosInfo;
    } else {
      androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    }
    super.onInit();
  }

  void startTimer(VoidCallback action) {
    const duration = Duration(minutes: AppConst.timeoutKyc);
    timer = Timer(duration, () {
      action();
      timer?.cancel();
    });
  }

  void clearData({bool clearUserInfo = false}) {
    authProfileRequestModel = AuthProfileResponseModel();
    infoORCRequest = OCRDataModel();
    qrUserInformation = QrUserInformation();
    sendNfcRequestGlobalModel = SendNfcRequestModel();
    configCertificateModel.itemSelectPackage = PackageInfoResponse();
    authProfileRequestModel = AuthProfileResponseModel();
    hiveApp.delete(AppKey.sessionId);
    if (clearUserInfo) {
      userInfoModel = UserInfoModel();
    }
  }

  void changeBusinessType() {
    isBusinessHousehold.toggle();
  }

  Future<void> initCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(
      cameras[0],
      ResolutionPreset.high,
      enableAudio: false,
    );
    await cameraController.initialize();
  }
}

Future<void> initHive() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  hiveApp = await Hive.openBox(LocaleKeys.app_name.tr);
  registerAdapters();
  await openBox();
  packageInfo = await PackageInfo.fromPlatform();
}

Future<void> openBox() async {
  hiveUserLogin = await Hive.openBox(HiveAdapters.loginCaRequestModel);
}

Future<void> initConfig() async {
  FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 1),
    minimumFetchInterval: const Duration(seconds: 10),
  ));

  fetchConfig(remoteConfig);

  String androidMinVersion = remoteConfig.getString(AppKey.keyVersionAndroid);
  String iosMinVersion = remoteConfig.getString(AppKey.keyVersionIos);

  upgrade = Upgrader(
    messages: UpgraderMessages(code: Get.locale?.languageCode),
    countryCode: Get.locale?.countryCode,
    // debugDisplayAlways: true,
    // minAppVersion: GetPlatform.isAndroid ? androidMinVersion : iosMinVersion,
  );
}

Future<void> fetchConfig(FirebaseRemoteConfig remoteConfig) async {
  try {
    await remoteConfig.fetchAndActivate();
  } catch (e) {
    debugPrint(e.toString());
  }
}
