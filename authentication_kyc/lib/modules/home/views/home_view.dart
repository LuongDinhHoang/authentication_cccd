part of 'home_page.dart';

Widget _body(HomeController controller) {
  return SizedBox(
    height: Get.height,
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(Assets.ASSETS_SVG_ICON_BANNER_HOME_SVG),
          sdsSBHeight25,
          Container(
            alignment: Alignment.center,
            child: Wrap(
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: AppDimens.padding15,
              runSpacing: AppDimens.padding15,
              direction: Axis.horizontal,
              children: HomeCollection.listActionItem.map((item) {
                // if (item.title ==
                //     LocaleKeys
                //         .certification_list_certificationListNotConfirmTitle.tr) {
                //   return Obx(
                //     () => UtilWidget.badgeCount(
                //       count: controller.unVerifiedCertCount.value,
                //       child: _itemAction(
                //         item: item.copyWith(
                //           func: () {
                //             Get.toNamed(
                //               AppRoutes.routeCertificationList,
                //               arguments: false,
                //             )?.then(
                //               (value) {
                //                 controller.getUnverifiedCertNumber();
                //               },
                //             );
                //           },
                //         ),
                //       ),
                //     ),
                //   );
                // } else {
                //   return _itemAction(item: item);
                // }
                return _itemAction(controller: controller, item: item);
              }).toList(),
            ),
          ),
        ],
      ).paddingAll(AppDimens.padding15),
    ),
  );
}

// Container _itemHome(item) {
//   return Container(
//     alignment: Alignment.center,
//     width: Get.width / 2 - AppDimens.padding30,
//     height: AppDimens.height100,
//     decoration: BoxDecoration(
//       color: AppColors.basicWhite,
//       borderRadius: BorderRadius.circular(AppDimens.radius8),
//     ),
//     child: Row(
//       children: [
//         SvgPicture.asset(item['imageUrl']),
//         Expanded(
//           child: TextUtils(
//             text: item['title'],
//             availableStyle: StyleEnum.bodyBold,
//             color: AppColors.basicBlack,
//             maxLine: 3,
//           ).paddingOnly(left: AppDimens.padding10),
//         ),
//       ],
//     ).paddingAll(AppDimens.padding10),
//   );
// }

Widget _itemAction({
  required HomeController controller,
  required HomeItem item,
}) {
  return GestureDetector(
    onTap: () => controller.fucItem(item),
    child: Container(
      alignment: Alignment.center,
      width: Get.width / 2 - AppDimens.padding30,
      height: AppDimens.height100,
      decoration: BoxDecoration(
        color: AppColors.basicWhite,
        borderRadius: BorderRadius.circular(AppDimens.radius8),
      ),
      child: Row(
        children: [
          SvgPicture.asset(item.imageUrl),
          Expanded(
            child: TextUtils(
              text: item.title,
              availableStyle: StyleEnum.bodyBold,
              color: AppColors.basicBlack,
              maxLine: 3,
            ).paddingOnly(left: AppDimens.padding10),
          ),
        ],
      ).paddingAll(AppDimens.padding10),
    ),
  );
}

PreferredSizeWidget _buildAppBar(HomeController controller) {
  return BackgroundAppBar.buildAppBar("",
      isColorGradient: false,
      centerTitle: false,
      leading: false,
      backgroundColor: AppColors.colorTransparent,
      titleWidget: Row(
        children: [
          // SvgPicture.asset(Assets.ASSETS_SVG_ICON_MORE_HOME_SVG),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextUtils(
                    text: LocaleKeys.home_homeTitle.tr,
                    availableStyle: StyleEnum.subBold,
                    color: AppColors.basicBlack,
                    textAlign: TextAlign.center,
                    maxLine: 2,
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     Get.toNamed(AppRoutes.routeNotification);
                //   },
                //   child: SvgPicture.asset(
                //     Assets.ASSETS_SVG_ICON_NOTIFICATION_SVG,
                //   ),
                // ),
                GestureDetector(
                  onTap: () {
                    // Get.bottomSheet(
                    //   SDSBottomSheet(
                    //     title: "",
                    //     body: _buildBottomSheet(controller),
                    //     noHeader: true,
                    //     // height: Get.height *4/7,
                    //   ),
                    //   isScrollControlled: true,
                    // );
                    controller.funcLogout();
                  },
                  child: SvgPicture.asset(
                    Assets.ASSETS_SVG_ICON_LOGOUT_SVG,
                  ),
                  // Tạm thời cmt v chưa ầy đủ chức năng
                  // child: CircleAvatar(
                  //     child: ClipRRect(
                  //   borderRadius: BorderRadius.circular(
                  //     AppDimens.btnMedium,
                  //   ),
                  //   child: SizedBox(
                  //     height: AppDimens.sizeImage,
                  //     width: AppDimens.sizeImage,
                  //     child: Image.asset(
                  //       Assets.ASSETS_JPG_IMAGE_DEFA ULT_JPG,
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // )).paddingOnly(left: AppDimens.padding5),
                ),
                // SDSImageNetwork(
                //   SDSImageNetworkModel(
                //     "controller.profile?.result?.avatar",
                //     fit: BoxFit.cover,
                //     borderRadius: const BorderRadius.all(
                //       Radius.circular(AppDimens.padding8),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: AppDimens.padding15));
}

Widget _buildBottomSheet(HomeController controller) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      _bottomSheetRow(
        Assets.ASSETS_SVG_ICON_USER_NAME_CARD_SVG,
        LocaleKeys.home_accountInfo.tr,
      ),
      _bottomSheetRow(
        Assets.ASSETS_SVG_ICON_LOCK_SVG,
        LocaleKeys.home_changePassword.tr,
      ),
      _bottomSheetRow(
        Assets.ASSETS_SVG_ICON_GLOBE_SVG,
        LocaleKeys.home_language.tr,
      ),
      _bottomSheetRow(
        Assets.ASSETS_SVG_ICON_BELL_SVG,
        LocaleKeys.home_notification.tr,
        onTap: () {
          Get.toNamed(AppRoutes.routeNotification);
        },
      ),
      _bottomSheetRow(
        Assets.ASSETS_SVG_ICON_TELEPHONE_SVG,
        LocaleKeys.home_customerService.tr,
      ),
      ButtonUtils.buildButton(
        LocaleKeys.home_logout.tr,
        controller.funcLogout,
        icon: Icons.logout_rounded,
      ),
    ],
  ).paddingOnly(bottom: AppDimens.padding10);
}

Widget _bottomSheetRow(String svgIcon, String title, {void Function()? onTap}) {
  return ListTile(
    title: TextUtils(
      text: title,
      size: AppDimens.sizeTextSmall,
    ),
    leading: SvgPicture.asset(
      svgIcon,
      width: 18,
    ),
    onTap: onTap,
  );
}

Container _positionTrash(HomeController controller) {
  return Container(
    height: AppDimens.padding80,
    alignment: AlignmentDirectional.bottomCenter,
    child: Obx(
      () => Visibility(
        visible: controller.isTrash.value,
        child: DragTarget(
          builder: (
            BuildContext context,
            List<dynamic> accepted,
            List<dynamic> rejected,
          ) {
            return Container(
              padding: const EdgeInsetsDirectional.only(bottom: 32),
              child: const CircleAvatar(
                backgroundColor: Colors.black54,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            );
          },
          onAccept: (data) {
            controller.isShowSupportCus.value = false;
          },
        ),
      ),
    ),
  );
}

Widget _floatingButton(HomeController controller) {
  return Obx(
    () => Visibility(
      visible: controller.isShowSupportCus.value,
      child: Positioned(
        top: controller.position.value.dy,
        left: controller.position.value.dx,
        child: Draggable(
          data: 1,
          feedback: SizedBox(
            height: AppDimens.size45,
            width: AppDimens.size45,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () async {},
              child: const Icon(
                Icons.phone,
                color: AppColors.primaryCam1,
              ),
            ),
          ),
          childWhenDragging: Container(),
          onDraggableCanceled: (Velocity velocity, Offset offset) {
            controller.setPositionChatBox(offset);
          },
          onDragStarted: () {
            controller.isTrash.value = true;
          },
          onDragEnd: (drag) {
            controller.isTrash.value = false;
          },
          child: Visibility(
            visible: controller.isShowSupportCus.value,
            child: SizedBox(
              height: AppDimens.size45,
              width: AppDimens.size45,
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () async {
                  await UtilWidget.launchInBrowser(
                      LocaleKeys.check_nfc_number_hotline.tr);
                },
                child: const Icon(Icons.phone,
                  color: AppColors.primaryCam1,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
