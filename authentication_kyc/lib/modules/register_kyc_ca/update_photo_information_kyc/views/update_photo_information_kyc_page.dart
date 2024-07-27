import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:authentication_kyc/assets.dart';
import 'package:authentication_kyc/base_app/base_app.src.dart';
import 'package:authentication_kyc/core/core.src.dart';
import 'package:authentication_kyc/generated/locales.g.dart';
import 'package:authentication_kyc/modules/register_kyc_ca/update_photo_information_kyc/update_photo_information_kyc.src.dart';
import 'package:authentication_kyc/shares/shares.src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'update_photo_information_kyc_view.dart';

class UpdatePhotoInformationPage extends BaseGetWidget<UpdateInformationController> {
  const UpdatePhotoInformationPage({Key? key}) : super(key: key);

  @override
  UpdateInformationController get controller =>
      Get.put(UpdateInformationController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: BackgroundAppBar.buildAppBar(
        LocaleKeys.update_information_kyc_registerCa.tr,
        isColorGradient: false,
        centerTitle: false,
        leading: true,
        backgroundColor: AppColors.colorTransparent,
      ),
      body: _body(controller),
      // bottomSheet:
      //     _buildButtonContinue(controller).paddingAll(AppDimens.padding15),
    );
  }
}
