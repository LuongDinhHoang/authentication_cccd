import 'dart:ffi';

import 'package:two_id_c06verify/assets.dart';
import 'package:two_id_c06verify/base_app/base_app.src.dart';
import 'package:two_id_c06verify/core/core.src.dart';
import 'package:two_id_c06verify/generated/locales.g.dart';
import 'package:two_id_c06verify/modules/home/home.src.dart';
import 'package:two_id_c06verify/shares/shares.src.dart';
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
