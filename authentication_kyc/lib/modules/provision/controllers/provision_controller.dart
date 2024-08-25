import 'package:two_id_c06verify/base_app/base_app.src.dart';
import 'package:two_id_c06verify/modules/provision/provision.src.dart';

import '../../../../shares/shares.src.dart';

class ProvisionController extends BaseGetxController {
  AppController appController = Get.find<AppController>();
  late ProvisionRepository provisionRepository = ProvisionRepository(this);
  String html = "";

  @override
  Future<void> onInit() async {
    showLoading();
    await provisionRepository.getPolicyRepository().then((value) {
      html = value.data ?? "";
    });
    hideLoading();
    super.onInit();
  }
}
