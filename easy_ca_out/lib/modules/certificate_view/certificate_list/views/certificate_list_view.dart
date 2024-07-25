part of 'certificate_list_page.dart';

Widget _body(CertificateListController controller) {
  return Obx(
    () => controller.listCert.isEmpty
        ? UtilWidget.buildEmptyList()
        : ListView.builder(
            itemBuilder: (context, index) => cardCertificate(
              data: controller.listCert[index],
              isVerified: controller.isVerifiedPage,
              controller: controller,
            ),
            itemCount: controller.listCert.length,
          ).paddingSymmetric(
            horizontal: AppDimens.padding8,
          ),
  );
}

Widget cardCertificate({
  bool isSelected = false,
  required CertificateModel data,
  required bool isVerified,
  required CertificateListController controller,
}) {
  return GestureDetector(
    onTap: () {
      Get.toNamed(AppRoutes.routeConfirmDigitalSign, arguments: data)
          ?.then((value) {
        if (value != null && value) {
          controller.getListCert();
        }
      });
    },
    child: Card(
      color: AppColors.basicWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppDimens.radius8,
        ),
        side: BorderSide(
          color: isSelected ? AppColors.primaryCam1 : AppColors.basicWhite,
          width: AppDimens.sizeWeight1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextUtils(
            text: LocaleKeys.certification_list_subscriptionName.tr +
                data.certSubjectCn,
            availableStyle: StyleEnum.bodyBold,
            color: isVerified ? AppColors.primaryCam1 : AppColors.statusRed,
          ),
          const SizedBox(
            height: AppDimens.padding10,
          ),
          _buildSerialLine(data.certSerial),
          const SizedBox(
            height: AppDimens.padding10,
          ),
          isVerified ? _buildExpiredDate(data) : _buildValidDate(data),
        ],
      ).paddingSymmetric(
        horizontal: AppDimens.padding12,
        vertical: AppDimens.padding16,
      ),
    ),
  );
}

RichText _buildValidDate(CertificateModel data) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: LocaleKeys.certification_list_validateFrom.tr,
          style: FontStyleUtils.fontStyleSans(
            fontSize: AppDimens.sizeTextSmall,
          ),
        ),
        TextSpan(
          text: " ${convertDateToString(data.certValidFrom, pattern1)} ",
          style: FontStyleUtils.fontStyleSans(
            fontSize: AppDimens.sizeTextSmall,
            fontWeight: FontWeight.bold,
            color: AppColors.basicBlack,
          ),
        ),
        TextSpan(
          text: LocaleKeys.certification_list_validateTo.tr,
          style: FontStyleUtils.fontStyleSans(
            fontSize: AppDimens.sizeTextSmall,
          ),
        ),
        TextSpan(
          text: " ${convertDateToString(data.certValidTo, pattern1)} ",
          style: FontStyleUtils.fontStyleSans(
            fontSize: AppDimens.sizeTextSmall,
            fontWeight: FontWeight.bold,
            color: AppColors.basicBlack,
          ),
        ),
      ],
    ),
  );
}

RichText _buildExpiredDate(CertificateModel data) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: LocaleKeys.certification_list_expiredDate.tr,
          style: FontStyleUtils.fontStyleSans(
            fontSize: AppDimens.sizeTextSmall,
          ),
        ),
        TextSpan(
          text: " ${convertDateToString(data.certValidTo, pattern1)} ",
          style: FontStyleUtils.fontStyleSans(
            fontSize: AppDimens.sizeTextSmall,
            fontWeight: FontWeight.bold,
            color: AppColors.basicBlack,
          ),
        ),
      ],
    ),
  );
}

RichText _buildSerialLine(String serial) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: LocaleKeys.certification_list_serial.tr,
          style: FontStyleUtils.fontStyleSans(
            fontSize: AppDimens.sizeTextSmall,
          ),
        ),
        TextSpan(
          text: serial.toUpperCase(),
          style: FontStyleUtils.fontStyleSans(
            fontSize: AppDimens.sizeTextSmall,
            fontWeight: FontWeight.bold,
            color: AppColors.basicBlack,
          ),
        ),
      ],
    ),
  );
}
