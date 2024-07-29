import 'package:authentication_kyc/base_app/base_app.src.dart';
import 'package:authentication_kyc/core/core.src.dart';
import 'package:authentication_kyc/modules/register_kyc_ca/scan_mrz/scan_mrz.src.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mrz_scanner/flutter_mrz_scanner.dart';

import '../../../../shares/shares.src.dart';

class ScanMZRPage extends BaseGetWidget<ScanMRZController> {
  const ScanMZRPage({Key? key}) : super(key: key);

  @override
  ScanMRZController get controller => Get.put(ScanMRZController());

  Widget _buildBody() {
    return Scaffold(
      backgroundColor: AppColors.basicWhite,
      body: Stack(
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                MRZScanner(
                  withOverlay: true,
                  onControllerCreated: controller.onControllerCreated,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildWidgets(BuildContext context) {
    return Obx(() => controller.isShowLoading.value
        ? Container(
            color: Colors.white,
            child: const Center(child: CupertinoActivityIndicator()))
        : _buildBody());
  }
}
