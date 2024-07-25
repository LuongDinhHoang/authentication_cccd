import 'package:easy_ca/assets.dart';
import 'package:easy_ca/base_app/base_app.src.dart';
import 'package:easy_ca/core/core.src.dart';
import 'package:easy_ca/generated/locales.g.dart';
import 'package:easy_ca/modules/register_kyc_ca/service_package/service_package_src.dart';
import 'package:easy_ca/modules/register_kyc_ca/verify_profile_ca/verify_profile_ca_src.dart';
import 'package:easy_ca/shares/shares.src.dart';
import 'package:easy_ca/shares/widgets/form/base_form_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


part 'listview_profile_view.dart';

part 'login_easy_ca_view.dart';

class VerifyProfilePage extends BaseGetWidget {
  const VerifyProfilePage({Key? key}) : super(key: key);

  @override
  VerifyProfileController get controller => Get.put(VerifyProfileController());

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
          LocaleKeys.verify_profile_titleVerify.tr,
          isColorGradient: false,
          centerTitle: false,
          leading: true,
          funcLeading: () => controller.funcLeadingBack(),
          backgroundColor: AppColors.colorTransparent,
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageViewController,
          onPageChanged: controller.handlePageViewChanged,
          children: [
            _buildLoginCa(controller),
            baseShowLoadingCustom(() => _buildListViewProfile(controller)),
          ],
        ),
        bottomSheet: _buildPermission(controller),
      ),
    );
  }
}
