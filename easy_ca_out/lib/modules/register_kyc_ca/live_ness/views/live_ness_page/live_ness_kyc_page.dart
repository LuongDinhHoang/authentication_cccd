import 'package:camera/camera.dart';
import 'package:easy_ca/base_app/base_app.src.dart';
import 'package:easy_ca/core/core.src.dart';
import 'package:easy_ca/generated/locales.g.dart';
import 'package:easy_ca/modules/register_kyc_ca/live_ness/live_ness_kyc.src.dart';
import 'package:easy_ca/shares/shares.src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:screenshot/screenshot.dart';

part 'live_ness_kyc_view.dart';

class LiveNessKycPage extends BaseGetWidget<LiveNessKycController> {
  const LiveNessKycPage({Key? key}) : super(key: key);

  @override
  LiveNessKycController get controller => Get.put(LiveNessKycController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: true,
        onPopInvoked: (bool didPop) {
          controller.closePros();
          if (didPop) {
            return;
          }
        },
        child: buildLoadingOverlay(
          () => _body(controller),
        ),
      ),
    );
  }
}
