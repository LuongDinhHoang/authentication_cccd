import 'package:two_id_c06verify/assets.dart';
import 'package:two_id_c06verify/base_app/base_app.src.dart';
import 'package:two_id_c06verify/core/core.src.dart';
import 'package:two_id_c06verify/generated/locales.g.dart';
import 'package:two_id_c06verify/modules/register_kyc_ca/nfc_kyc/nfc_dialog/nfc_dialog.src.dart';
import 'package:two_id_c06verify/shares/shares.src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class NfcDialog extends BaseGetWidget<NfcDialogController> {
  @override
  NfcDialogController get controller => Get.put(NfcDialogController());

  const NfcDialog({Key? key}) : super(key: key);

  @override
  Widget buildWidgets(BuildContext context) {
    return Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.center,
              child: TextUtils(
                text: controller.isReading.value
                    ? LocaleKeys.nfc_nfcWaitingTitle.tr
                    : LocaleKeys.nfc_dialogTitle.tr,
                availableStyle: StyleEnum.heading2Bold,
                color: AppColors.basicGrey1,
              ).paddingOnly(
                  top: AppDimens.padding20, bottom: AppDimens.padding15),
            ),
            SvgPicture.asset(Assets.ASSETS_SVG_ICON_SCAN_NFC_SVG),
            TextUtils(
              text: controller.isReading.value
                  ? LocaleKeys.nfc_nfcWaiting.tr
                  : LocaleKeys.nfc_dialogContent.tr,
              availableStyle: StyleEnum.bodyRegular,
              color: AppColors.basicBlack,
              maxLine: 3,
              textAlign: TextAlign.center,
            ).paddingAll(AppDimens.padding10),
            buildProgressBar(controller),
            ButtonUtils.buildButton(
              LocaleKeys.nfc_buttonSkip.tr,
              () async {
                Get.back();
                await controller.nfc.disconnect();
                controller.isReading.value = false;
              },
              // isLoading: controller.isShowLoading.value,
              backgroundColor: AppColors.basicWhite,
              border: Border.all(width: 1, color: AppColors.primaryBlue1),
              borderRadius: BorderRadius.circular(AppDimens.radius4),
              colorText: AppColors.primaryBlue1,
            ).paddingAll(AppDimens.padding15)
          ],
        ).paddingOnly(bottom: AppDimens.padding10));
  }

  Widget buildProgressBar(NfcDialogController controller) {
    return Visibility(
      visible: controller.isReading.value,
      child: LinearPercentIndicator(
        width: Get.width / 1.5,
        lineHeight: 3,
        alignment: MainAxisAlignment.center,
        percent: controller.processQuantity.value / controller.maxProcess,
        progressColor: AppColors.primaryBlue1,
        barRadius: const Radius.circular(AppDimens.radius4),
      ).paddingOnly(top: AppDimens.padding4, bottom: AppDimens.padding4),
    );
  }
}
