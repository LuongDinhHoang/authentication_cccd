import 'package:two_id_c06verify/assets.dart';
import 'package:two_id_c06verify/base_app/base_app.src.dart';
import 'package:two_id_c06verify/core/core.src.dart';
import 'package:two_id_c06verify/generated/locales.g.dart';
import 'package:two_id_c06verify/modules/register_kyc_ca/await_ocr_data/await_ocr_data.src.dart';
import 'package:two_id_c06verify/shares/shares.src.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../shares/widgets/text/font_style.dart';

part 'await_ocr_data_view.dart';

class AwaitORCDataPage extends BaseGetWidget<AwaitORCDataController> {
  const AwaitORCDataPage({Key? key}) : super(key: key);

  @override
  AwaitORCDataController get controller => Get.put(AwaitORCDataController());

  @override
  Widget buildWidgets(context) {
    return Scaffold(
      body: _body(controller),
    );
  }
}
