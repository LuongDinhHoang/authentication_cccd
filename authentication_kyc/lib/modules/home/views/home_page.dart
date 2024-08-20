import 'dart:ffi';

import 'package:two_id_c06verify/assets.dart';
import 'package:two_id_c06verify/base_app/base_app.src.dart';
import 'package:two_id_c06verify/core/core.src.dart';
import 'package:two_id_c06verify/generated/locales.g.dart';
import 'package:two_id_c06verify/modules/home/home.src.dart';
import 'package:two_id_c06verify/modules/home/views/bottom_navigation.dart';
import 'package:two_id_c06verify/shares/shares.src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'home_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final GlobalKey<_HomePageState> homePageKey =
  GlobalKey<_HomePageState>();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late HomeController controller;
  late TabController tabController;
  TabItem currentTab = TabItem.homePage;

  @override
  void initState() {
    super.initState();
    controller = Get.put(HomeController());
    tabController =
        TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => PopScope(
      // onWillPop: () async {
      //   if (controller.currentTab.value == TabItem.homePage) {
      //     return true;
      //   } else {
      //     tabController.animateTo(0);
      //     controller.funcPageChange(0);
      //     return false;
      //   }
      // },
      child: DefaultTabController(
        length: HomeConst.tabName.length,
        child: Scaffold(
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: tabController,
            children: [
              // OverviewPage(),
              const SizedBox(),
              const SizedBox(),
              const SizedBox(),
              const SizedBox(),
              // const DocumentsManagementPage(),
              // const NotificationPage(),
              // const PersonalPage(),
            ],
          ),
          bottomNavigationBar: BottomNavigation(
            currentTab: controller.currentTab.value,
            homeController: controller,
            tabController: tabController,
          ),
        ),
      ),
    ));
  }

  // Widget _buildMode({required Widget child}) {
  //   return UpgradeAlert(
  //     upgrader: upgrade,
  //     child: child,
  //   );
  // }

  @override
  void dispose() {
    controller.dispose();
    tabController.dispose();
    super.dispose();
  }
}
