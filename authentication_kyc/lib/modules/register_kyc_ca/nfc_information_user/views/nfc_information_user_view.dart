part of 'nfc_information_user_page.dart';

Widget _buildListGuild(NfcInformationUserController controller) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              Assets.ASSETS_SVG_ICON_DONE_SVG,
            ),
            sdsSBWidth10,
            const TextUtils(
              text: "Dữ liệu xác thực với bộ công an hợp lệ !",
              availableStyle: StyleEnum.bodyBold,
              maxLine: 3,
            ),
          ],
        ),
        Image.memory(
          base64Decode(controller.image ?? ""),
          width: 150,
        ).paddingSymmetric(vertical: AppDimens.padding10),
        _buildItemText(LocaleKeys.nfcInformationUserPage_firstName.tr,
            controller.sendNfcRequestModel.nameVNM),
        _buildItemText(LocaleKeys.nfcInformationUserPage_idCard.tr,
            controller.sendNfcRequestModel.number),
        (controller.sendNfcRequestModel.otherPaper != "" &&
                controller.sendNfcRequestModel.otherPaper != null)
            ? _buildItemText(LocaleKeys.nfcInformationUserPage_otherPaper.tr,
                controller.sendNfcRequestModel.otherPaper)
            : const SizedBox(),

        // sizeBoxHeight12(),
        // _buildItemText(
        //     '${LocaleKeys.nfcInformationUserPage_lastName.tr}: ${controller.lastName}',
        //     Assets.ASSETS_SVG_ICON_USER_NAME_CARD_SVG),
        _buildItemText(LocaleKeys.nfcInformationUserPage_dateOfBirth.tr,
            controller.dateOfBirth),
        _buildItemText(LocaleKeys.nfcInformationUserPage_gender.tr,
            controller.sendNfcRequestModel.sexVMN),
        _buildItemText(LocaleKeys.nfcInformationUserPage_nationality.tr,
            controller.sendNfcRequestModel.nationalityVMN),
        _buildItemText(LocaleKeys.nfcInformationUserPage_religion.tr,
            controller.sendNfcRequestModel.religionVMN),
        _buildItemText(LocaleKeys.nfcInformationUserPage_nation.tr,
            controller.sendNfcRequestModel.religionVMN),
        _buildItemText(LocaleKeys.nfcInformationUserPage_homeTown.tr,
            controller.sendNfcRequestModel.homeTownVMN),
        _buildItemText(LocaleKeys.nfcInformationUserPage_resident.tr,
            controller.sendNfcRequestModel.residentVMN),
        _buildItemText(LocaleKeys.nfcInformationUserPage_identificationSigns.tr,
            controller.sendNfcRequestModel.identificationSignsVNM),

        _buildItemText(LocaleKeys.nfcInformationUserPage_dateOfExpiry.tr,
            controller.dateOfExpiry),
        _buildItemText(LocaleKeys.nfcInformationUserPage_registrationDate.tr,
            controller.sendNfcRequestModel.registrationDateVMN),
        _buildItemText(LocaleKeys.nfcInformationUserPage_nameDad.tr,
            controller.sendNfcRequestModel.nameDadVMN),
        _buildItemText(LocaleKeys.nfcInformationUserPage_nameMom.tr,
            controller.sendNfcRequestModel.nameMomVMN),
        (controller.sendNfcRequestModel.nameCouple != "" &&
                controller.sendNfcRequestModel.nameCouple != null)
            ? _buildItemText(
                controller.sendNfcRequestModel.sex == "M"
                    ? "Tên vợ:"
                    : "Tên chồng:",
                controller.sendNfcRequestModel.nameCouple)
            : const SizedBox(),
      ],
    ),
  );
}

SizedBox sizeBoxHeight12() {
  return const SizedBox(
    height: 12,
  );
}

Widget _buildItemText(String title, String? content) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // buildBaseIcon(assetIcon).paddingOnly(right: AppDimens.padding5),
          TextUtils(
            text: title,
            availableStyle: StyleEnum.bodyBold,
            maxLine: 3,
          ),
          sdsSBWidth8,
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: TextUtils(
                text: content ?? "đình hoàng",
                availableStyle: StyleEnum.bodyBold,
                color: AppColors.primaryBlue1,
                maxLine: 3,
              ),
            ),
          ),
        ],
      ),
      sizeBoxHeight12(),
    ],
  );
}

Widget buildBaseText(String text) {
  return TextUtils(
    text: text,
    availableStyle: StyleEnum.bodyRegular,
    maxLine: 3,
  );
}

Widget buildBaseIcon(String assetIcon) {
  return SvgPicture.asset(
    assetIcon,
    width: 16,
    height: 16,
  );
}
