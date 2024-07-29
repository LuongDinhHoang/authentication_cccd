import 'package:authentication_kyc/base_app/base_app.src.dart';
import 'package:authentication_kyc/core/core.src.dart';
import 'package:authentication_kyc/shares/utils/time/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_mrz_scanner/flutter_mrz_scanner.dart';

class ScanMRZController extends BaseGetxController {
  final AppController appController = Get.find<AppController>();
  late MRZController cameraController;
  bool isParsed = false;

  @override
  Future<void> onInit() async {
    // showLoading();
    // hideLoading();

    super.onInit();
  }

  void onControllerCreated(MRZController controller) {
    cameraController = controller;
    controller.onParsed = (result) async {
      if (isParsed) {
        return;
      }
      isParsed = true;

      await showDialog<void>(
          context: Get.context!,
          builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Document type: ${result.documentType}'),
                  Text('Country: ${result.countryCode}'),
                  Text('Surnames: ${result.surnames}'),
                  Text('Given names: ${result.givenNames}'),
                  Text('Document number: ${result.documentNumber}'),
                  Text('Nationality code: ${result.nationalityCountryCode}'),
                  Text('Birthdate: ${result.birthDate}'),
                  Text('Sex: ${result.sex}'),
                  Text('Expriy date: ${result.expiryDate}'),
                  Text('Personal number: ${result.personalNumber}'),
                  Text('Personal number 2: ${result.personalNumber2}'),
                  ElevatedButton(
                    child: const Text('ok'),
                    onPressed: () {
                      isParsed = false;
                      return Navigator.pop(context, true);
                    },
                  ),
                ],
              )));
    };

    cameraController.startPreview();
  }

  @override
  void dispose() {
    cameraController.stopPreview();
    super.dispose();
  }

  @override
  void onClose() {
    cameraController.stopPreview();
  }

}
