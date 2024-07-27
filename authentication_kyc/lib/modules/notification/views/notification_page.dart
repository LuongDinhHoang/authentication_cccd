import 'package:authentication_kyc/base_app/base_app.src.dart';
import 'package:authentication_kyc/core/core.src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../assets.dart';
import '../../../generated/locales.g.dart';
import '../../../shares/shares.src.dart';
import '../notification.src.dart';

part 'notification_view.dart';

class NotificationPage extends BaseGetWidget<NotificationController> {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  NotificationController get controller => Get.put(NotificationController());

  @override
  Widget buildWidgets(context) {
    return Scaffold(
      appBar: BackgroundAppBar.buildAppBar(LocaleKeys.notification_notificationTitle.tr),
      body: _body(controller),
    );
  }
}

Widget _body(NotificationController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextUtils(
        text: LocaleKeys.notification_today.tr,
        availableStyle: StyleEnum.bodyBold,
      ).paddingSymmetric(horizontal: AppDimens.padding12),
      Expanded(child: _buildListNoti(controller))
    ],
  );
}
