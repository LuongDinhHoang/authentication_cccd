import 'package:two_id_c06verify/base_app/controllers_base/base_controller/base_controller.dart';
import 'package:two_id_c06verify/modules/notification/models/notification_model.dart';

class NotificationController extends BaseGetxController {
  List<NotificationModel> listNoti = <NotificationModel>[
    NotificationModel(type: 1, content: "Chứng thư số đã được cấp phát thành công", time: 1),
    NotificationModel(type: 2, content: "Bạn cần xác nhận thông tin Chứng thư số", time: 2),
  ];
}
