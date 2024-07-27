import 'package:authentication_kyc/assets.dart';
import 'package:authentication_kyc/base_app/base_app.src.dart';
import 'package:authentication_kyc/core/core.src.dart';
import 'package:authentication_kyc/generated/locales.g.dart';
import 'package:authentication_kyc/modules/register_kyc_ca/await_ocr_data/await_ocr_data.src.dart';
import 'package:authentication_kyc/shares/shares.src.dart';
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
