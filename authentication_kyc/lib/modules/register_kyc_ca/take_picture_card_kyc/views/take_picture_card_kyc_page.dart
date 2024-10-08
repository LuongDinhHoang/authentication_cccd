import 'dart:math';

import 'package:camera/camera.dart';
import 'package:two_id_c06verify/assets.dart';
import 'package:two_id_c06verify/base_app/base_app.src.dart';
import 'package:two_id_c06verify/core/core.src.dart';
import 'package:two_id_c06verify/generated/locales.g.dart';
import 'package:two_id_c06verify/modules/register_kyc_ca/take_picture_card_kyc/take_picture_card_kyc.src.dart';
import 'package:two_id_c06verify/shares/shares.src.dart';
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
