import 'dart:async';

import 'package:authentication_kyc/base_app/base_app.src.dart';
import 'package:authentication_kyc/core/core.src.dart';
import 'package:authentication_kyc/modules/register_kyc_ca/await_ocr_data/await_ocr_data.src.dart';
import 'package:authentication_kyc/shares/shares.src.dart';

class AwaitORCDataController extends BaseGetxController {
  late AwaitOcrDataRepository awaitOcrDataRepository;
  AppController appController = Get.find<AppController>();
  bool _isProcessing = false;
  late Timer _timer;

  @override
  Future<void> onInit() async {
    awaitOcrDataRepository = AwaitOcrDataRepository(this);
    // await Future.delayed(Duration(seconds: 5));
    await _getORC();
    super.onInit();
  }

  Future<void> _getORC() async {
    await _getORCCall();
    _timer = Timer.periodic(const Duration(seconds: AppConst.timePeriodic),
        (Timer timer) async {
      if (!_isProcessing) {
        _isProcessing = true;
        await _getORCCall();
      } /*else {
        print('Skipping processing because it is already in progress.');
      }*/
    });
  }

  Future<void> _getORCCall() async {
    try {
      await awaitOcrDataRepository.getORCRepository().then((value) async {
        if (value.success == EnumStatusResponse.success) {
          if (value.data != null) {
            appController.infoORCRequest = value.data!;
            closeTime();
          }
          Get.offNamed(AppRoutes.routeConfirmInformation);
        } else if (value.success == EnumStatusResponse.responseErrorKyc) {
          closeTime();
          Get.offNamed(AppRoutes.routeConfirmInformation);
        } else if (value.success == EnumStatusResponse.responseAwaitKyc) {
          // showSnackBar("Dữ liệu chưa kịp tải vui lòng chờ ....");
          _isProcessing = false;
        }
      });
    } catch (e) {
      Get.offNamed(AppRoutes.routeConfirmInformation);
      closeTime();
    }
  }
   void closeTime(){
     if (appController.timer != null) {
       appController.timer?.cancel();
     }
   }

  @override
  void onClose() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    super.onClose();
  }
}
