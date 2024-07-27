import 'package:authentication_kyc/assets.dart';
import 'package:authentication_kyc/base_app/base_app.src.dart';
import 'package:authentication_kyc/core/core.src.dart';
import 'package:authentication_kyc/generated/locales.g.dart';
import 'package:authentication_kyc/modules/register_kyc_ca/confirm_information/confirm_information_src.dart';
import 'package:authentication_kyc/modules/register_kyc_ca/service_package/service_package_src.dart';
import 'package:authentication_kyc/shares/shares.src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:signature/signature.dart';

part 'form_input_information_view.dart';
part 'payment_contract_view.dart';
part 'sign_confirmation_view.dart';

class ConfirmInformationPage extends BaseGetWidget {
  const ConfirmInformationPage({Key? key}) : super(key: key);

  @override
  ConfirmInformationController get controller =>
      Get.put(ConfirmInformationController());

  @override
  Widget buildWidgets(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        controller.funcLeadingBack();
      },
      child: Scaffold(
        appBar: BackgroundAppBar.buildAppBar(
          LocaleKeys.registerCa_tileAppbarCa.tr,
          isColorGradient: false,
          centerTitle: false,
          leading: true,
          backgroundColor: AppColors.colorTransparent,
          funcLeading: () => controller.funcLeadingBack(),
        ),
        body: _buildBody(controller),
      ),
    );
  }

  Widget _buildBody(ConfirmInformationController controller) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller.pageViewController,
      onPageChanged: controller.handlePageViewChanged,
      children: [
        _buildSignConfirmation(controller),
        _buildFormInput(controller),
        // _buildPaymentContract(controller),
      ],
    );
  }
}
