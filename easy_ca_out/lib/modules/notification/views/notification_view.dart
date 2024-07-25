part of 'notification_page.dart';

Widget _buildListNoti(NotificationController controller) {
  return ListView.builder(
    itemBuilder: (context, index) => _buildNotiItem(controller.listNoti[index]),
    itemCount: controller.listNoti.length,
  );
}

Widget _buildNotiItem(NotificationModel noti) {
  //TODO: Creater noti enum follow API type
  String getIcon(int notiType) {
    switch (notiType) {
      case 1:
        return Assets.ASSETS_SVG_ICON_NOTI_SUCCESS_SVG;
      default:
        return Assets.ASSETS_SVG_ICON_NOTI_BELL_SVG;
    }
  }

  return ListTile(
    leading: SvgPicture.asset(
      getIcon(noti.type),
      width: AppDimens.padding20,
    ),
    title: TextUtils(
      text: noti.content,
      availableStyle: StyleEnum.bodyRegular,
      maxLine: 2,
    ),
    subtitle: TextUtils(
      text: noti.time.toString() + LocaleKeys.notification_hourAgo.tr,
      size: AppDimens.sizeTextSmaller,
      color: AppColors.basicGrey2,
    ),
    onTap: noti.type == 2
        ? () {
            Get.toNamed(AppRoutes.routeConfirmDigitalSign);
          }
        : null,
  );
}
