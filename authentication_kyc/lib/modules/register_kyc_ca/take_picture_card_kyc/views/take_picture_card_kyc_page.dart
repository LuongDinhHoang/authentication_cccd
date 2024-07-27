import 'dart:math';

import 'package:camera/camera.dart';
import 'package:authentication_kyc/assets.dart';
import 'package:authentication_kyc/base_app/base_app.src.dart';
import 'package:authentication_kyc/core/core.src.dart';
import 'package:authentication_kyc/generated/locales.g.dart';
import 'package:authentication_kyc/modules/register_kyc_ca/take_picture_card_kyc/take_picture_card_kyc.src.dart';
import 'package:authentication_kyc/shares/shares.src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:screenshot/screenshot.dart';

part 'take_picture_card_kyc_view.dart';

class TakePictureCardKycPage
    extends BaseGetWidget<TakePictureCardKycController> {
  const TakePictureCardKycPage({Key? key}) : super(key: key);

  @override
  TakePictureCardKycController get controller =>
      Get.put(TakePictureCardKycController());

  @override
  Widget buildWidgets(BuildContext context) {
    return buildLoadingOverlay(
      () => Scaffold(
        appBar: controller.imageTemp.value == null
            ? null
            : BackgroundAppBar.buildAppBar(
                LocaleKeys.update_information_kyc_registerCa.tr,
                isColorGradient: false,
                centerTitle: false,
                leading: true,
                backgroundColor: AppColors.colorTransparent,
              ),
        body: _body(controller),
      ),
      colorIcon: AppColors.basicWhite
    );
  }
}
