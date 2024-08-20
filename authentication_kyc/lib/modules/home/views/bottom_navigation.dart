import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_id_c06verify/assets.dart';
import 'package:two_id_c06verify/core/core.src.dart';
import 'package:two_id_c06verify/modules/home/home.src.dart';
import 'package:two_id_c06verify/shares/shares.src.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
    required this.currentTab,
    // required this.onSelectTab,
    // required this.count,
    required this.homeController,
    required this.tabController,
  }) : super(key: key);
  final TabItem currentTab;

  // final ValueChanged<TabItem> onSelectTab;
  // final int count;
  final HomeController homeController;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: GetPlatform.isIOS
          ? AppDimens.heightBottomTabBar
          : AppDimens.heightBottomTabBarAndroid,
      // color: AppColors.white,
      decoration: BoxDecoration(
        color: Colors.white, // Màu nền của Container
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // Màu bóng và độ mờ
            spreadRadius: 1, // Bán kính bóng
            blurRadius: 2, // Độ mờ
            // offset: Offset(0, 0), // Độ dịch chuyển của bóng
          ),
        ],
      ),
      // decoration: const BoxDecoration(
      //     borderRadius: BorderRadius.vertical(
      //         top: Radius.circular(AppDimens.sizeBorderNavi)),
      //     color: AppColors.white),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              child: TabBar(
                // indicator: CustomIndicator(),
                indicatorColor: Colors.transparent,
                onTap: (index) async {
                  homeController.funcPageChange(index);
                },
                splashBorderRadius: const BorderRadius.vertical(
                    top: Radius.circular(AppDimens.sizeBorderNavi)),
                controller: tabController,
                isScrollable: false,
                labelPadding: EdgeInsets.zero,
                tabs: [
                  _bottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        currentTab != TabItem.homePage
                            ? Assets.ASSETS_SVG_ICON_HOME_AUTHENTICATION_SVG
                            : Assets.ASSETS_SVG_ICON_HOME_AUTHENTICATION_FOCUS_SVG,
                        // color: currentTab != TabItem.homePage
                        //     ? AppColors.primaryBlue1
                        //     : AppColors.basicGrey4,
                      ),
                      isSelect: currentTab == TabItem.homePage,
                      label: "Xác thưc"),
                  _bottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        currentTab != TabItem.documentManagement
                            ? Assets.ASSETS_SVG_ICON_HOME_LIST_USER_SVG
                            : Assets.ASSETS_SVG_ICON_HOME_LIST_USER_FOCUS_SVG,
                        // color: currentTab != TabItem.documentManagement
                        //     ? AppColors.primaryBlue1
                        //     : AppColors.basicGrey4,
                      ),
                      isSelect: currentTab == TabItem.documentManagement,
                      label: "Khách hàng"),
                  _bottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        currentTab != TabItem.notify
                            ? Assets.ASSETS_SVG_ICON_HOME_SERVICE_PACKAGE_SVG
                            : Assets.ASSETS_SVG_ICON_HOME_SERVICE_PACKAGE_FOCUS_SVG,
                        // color: currentTab != TabItem.notify
                        //     ? AppColors.primaryBlue1
                        //     : AppColors.basicGrey4,
                      ),
                      isSelect: currentTab == TabItem.notify,
                      label: "Gói dich vụ"),
                  _bottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        currentTab != TabItem.profile
                            ? Assets.ASSETS_SVG_ICON_HOME_OTHER_SVG
                            : Assets.ASSETS_SVG_ICON_HOME_OTHER_SVG,
                        // color: currentTab != TabItem.profile
                        //     ? AppColors.primaryBlue1
                        //     : AppColors.basicGrey4,
                      ),
                      isSelect: currentTab == TabItem.profile,
                      label: "Khác")
                ],
              ).paddingOnly(
                  left: AppDimens.paddingTabBar,
                  right: AppDimens.paddingTabBar),
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppDimens.sizeBorderNavi)),
            ),
          ),
        ],
      ),
    );
  }

  _bottomNavigationBarItem({
    required Widget icon,
    required bool isSelect,
    required String label,
  }) {
    return SizedBox(
      width: Get.width / HomeConst.tabName.length - AppDimens.paddingTabBar / 3,
      child: Padding(
          padding: const EdgeInsets.only(
            bottom: AppDimens.paddingSmallBottomNavigation,
            left: AppDimens.paddingSmallBottomNavigation,
            right: AppDimens.paddingSmallBottomNavigation,
            top: AppDimens.paddingBottomTabBar,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 25,
                  height: 25,
                  child: icon),
              // sdsSB8,
              TextUtils(
                text: label,
                availableStyle: StyleEnum.bodyRegular,
                color:
                    isSelect ? AppColors.primaryBlue1 : AppColors.basicGrey40,
              ),
              /*                const SizedBox(
                    height: 5,
                  ),
                  isSelect
                      ? Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                              color: AppColors.colorsOrange,
                              borderRadius: BorderRadius.circular(8)),
                        )
                      : const SizedBox(),*/
            ],
          )),
    );
  }
}
