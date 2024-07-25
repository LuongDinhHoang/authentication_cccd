import 'package:easy_ca/assets.dart';
import 'package:easy_ca/base_app/base_app.src.dart';
import 'package:easy_ca/core/core.src.dart';
import 'package:easy_ca/shares/shares.src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends GetView<AppController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AppController(), permanent: true);
    return Container(
      color: AppColors.basicGrey4,
      alignment: Alignment.center,
      child: Center(
        child: SvgPicture.asset(Assets.ASSETS_SVG_ICON_KYC_SVG),
      ),
    );
  }
}
