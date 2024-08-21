import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:two_id_c06verify/assets.dart';
import 'package:two_id_c06verify/core/core.src.dart';
import 'package:two_id_c06verify/modules/home/home.src.dart';
import 'package:two_id_c06verify/modules/home/views/bottom_navigation.dart';
import 'package:two_id_c06verify/shares/shares.src.dart';

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
    tabController = TabController(length: 4, vsync: this);
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
                children: const [
                  // OverviewPage(),
                  SizedBox(),
                  SizedBox(),
                  SizedBox(),
                  SizedBox(),
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
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: SizedBox(
                width: 55,
                height: 55,
                child: FloatingActionButton(
                  backgroundColor: AppColors.basicWhite,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                        width: 1, color: AppColors.primaryBlue1),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: SvgPicture.asset(
                    Assets.ASSETS_SVG_ICON_HOME_AUTHENTICATION_FOCUS_SVG,
                  ),
                ),
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
