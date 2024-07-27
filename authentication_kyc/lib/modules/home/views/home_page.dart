import 'dart:ffi';

import 'package:authentication_kyc/assets.dart';
import 'package:authentication_kyc/base_app/base_app.src.dart';
import 'package:authentication_kyc/core/core.src.dart';
import 'package:authentication_kyc/generated/locales.g.dart';
import 'package:authentication_kyc/modules/home/home.src.dart';
import 'package:authentication_kyc/shares/shares.src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'home_view.dart';

class HomePage extends BaseGetWidget<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomeController get controller => Get.put(HomeController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Obx(
      () => PopScope(
        canPop: controller.isBack.value,
        onPopInvoked: (bool didPop) async {
          controller.onWillPop();
          if (didPop) {
            return;
          }
        },
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Scaffold(
              appBar: _buildAppBar(controller),
              body: _body(controller),
            ),
            _floatingButton(controller),
            _positionTrash(controller)
          ],
        ),
      ),
    );
  }
}
