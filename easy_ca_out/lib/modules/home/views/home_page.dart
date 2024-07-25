import 'package:easy_ca/assets.dart';
import 'package:easy_ca/base_app/base_app.src.dart';
import 'package:easy_ca/core/core.src.dart';
import 'package:easy_ca/generated/locales.g.dart';
import 'package:easy_ca/modules/home/home.src.dart';
import 'package:easy_ca/shares/shares.src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:upgrader/upgrader.dart';

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
              body: UpgradeAlert(
                upgrader: upgrade,
                child: _body(controller),
              ),
            ),
            _floatingButton(controller),
            _positionTrash(controller)
          ],
        ),
      ),
    );
  }
}
