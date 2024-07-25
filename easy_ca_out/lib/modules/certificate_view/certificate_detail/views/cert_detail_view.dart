part of 'cert_detail_page.dart';

Widget _body(CertificateDetailController controller) {
  return Column(
    children: [
      Expanded(
        child: _buildCertificationInfor(controller.certificateInfo),
      ),
      if (controller.certificateInfo.verifyCertStatus ==
          EnumCertVerifyStatus.unVerified) ...[
        _buildConfirmAction(controller),
        _buildActionButtons(controller),
      ],
    ],
  );
}

Widget _buildCertificationInfor(CertificateModel info) {
  return Column(
    children: [
      _buildInforItem(
          LocaleKeys.certification_detail_subcriberName.tr, info.certSubjectCn),
      _buildInforItem(LocaleKeys.certification_detail_citizenId.tr, info.idNumber),
      _buildInforItem(LocaleKeys.certification_detail_validFrom.tr,
          convertDateToStringTimeZone(info.certValidFrom, pattern10) ?? ""),
      _buildInforItem(LocaleKeys.certification_detail_validTo.tr,
          convertDateToStringTimeZone(info.certValidTo, pattern10) ?? ""),
      // _buildInforItem(LocaleKeys.certification_detail_district.tr, info.certSubjectL),
      _buildInforItem(LocaleKeys.certification_detail_city.tr, info.certSubjectSt),
      _buildInforItem(
          LocaleKeys.certification_detail_ctsSerial.tr, info.certSerial.toUpperCase()),
    ],
  ).paddingSymmetric(horizontal: AppDimens.padding15);
}

Widget _buildInforItem(String title, String content) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextUtils(
        text: title,
        availableStyle: StyleEnum.bodyBold,
      ),
      Expanded(
        child: TextUtils(
          text: content,
          availableStyle: StyleEnum.bodyRegular,
          maxLine: 2,
        ),
      ),
    ],
  ).paddingSymmetric(vertical: AppDimens.padding4);
}

Widget _buildConfirmAction(CertificateDetailController controller) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Obx(
        () => Checkbox(
          value: controller.isConfirmedCheck.value,
          onChanged: controller.changeCheckboxConfirm,
          checkColor: AppColors.basicWhite,
          activeColor: AppColors.primaryCam1,
        ),
      ),
      Expanded(
        child: TextUtils(
          text: LocaleKeys.certification_detail_infoConfirm.tr,
          availableStyle: StyleEnum.bodyRegular,
          maxLine: 5,
        ).paddingOnly(
          top: AppDimens.padding10,
          right: AppDimens.padding15,
        ),
      ),
    ],
  );
}

Widget _buildActionButtons(CertificateDetailController controller) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      const SizedBox(
        height: AppDimens.padding10,
      ),
      ButtonUtils.buildButton(
        LocaleKeys.certification_detail_confirm.tr,
        controller.sendVerifyCert,
        backgroundColor: AppColors.primaryCam1,
      ),
      const SizedBox(
        height: AppDimens.padding8,
      ),
      ButtonUtils.buildButton(LocaleKeys.certification_detail_cancel.tr, () {
        Get.back();
      }, backgroundColor: AppColors.basicGrey2),
      const SizedBox(
        height: AppDimens.padding10,
      ),
    ],
  ).paddingSymmetric(horizontal: AppDimens.padding15);
}
