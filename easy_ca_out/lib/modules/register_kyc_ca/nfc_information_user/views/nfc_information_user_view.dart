part of 'nfc_information_user_page.dart';

Widget _buildListGuild(NfcInformationUserController controller) {
  return SingleChildScrollView(
    child: Column(
      children: [
        // buildInput(TextInputModel(textEditingController: controller.image1)),
        Image.memory(
          base64Decode(controller.image ?? ""),
          width: 150,
        ),
        sdsSBDefault,
        _buildItemText(
            '${LocaleKeys.nfcInformationUserPage_idCard.tr}: ${controller.sendNfcRequestModel.number}',
            Assets.ASSETS_SVG_ICON_CARD_INFO_SVG),
        (controller.sendNfcRequestModel.otherPaper != "" &&
                controller.sendNfcRequestModel.otherPaper != null)
            ? _buildItemText(
                '${LocaleKeys.nfcInformationUserPage_otherPaper.tr}: ${controller.sendNfcRequestModel.otherPaper}',
                Assets.ASSETS_SVG_ICON_CARD_INFO_SVG)
            : const SizedBox(),
        _buildItemText(
            '${LocaleKeys.nfcInformationUserPage_firstName.tr}: ${controller.sendNfcRequestModel.nameVNM}',
            Assets.ASSETS_SVG_ICON_USER_NAME_CARD_SVG),
        // sizeBoxHeight12(),
        // _buildItemText(
        //     '${LocaleKeys.nfcInformationUserPage_lastName.tr}: ${controller.lastName}',
        //     Assets.ASSETS_SVG_ICON_USER_NAME_CARD_SVG),
        _buildItemText(
            '${LocaleKeys.nfcInformationUserPage_gender.tr}: ${controller.sendNfcRequestModel.sexVMN}',
            Assets.ASSETS_SVG_ICON_GENDER_SVG),
        _buildItemText(
            '${LocaleKeys.nfcInformationUserPage_nationality.tr}: ${controller.sendNfcRequestModel.nationalityVMN}',
            Assets.ASSETS_SVG_ICON_NATIONALITY_SVG),
        _buildItemText(
            '${LocaleKeys.nfcInformationUserPage_religion.tr}: ${controller.sendNfcRequestModel.religionVMN}',
            Assets.ASSETS_SVG_ICON_NATIONALITY_SVG),
        _buildItemText(
            '${LocaleKeys.nfcInformationUserPage_nation.tr}: ${controller.sendNfcRequestModel.nationVNM}',
            Assets.ASSETS_SVG_ICON_NFC_NATION_SVG),
        _buildItemText(
            '${LocaleKeys.nfcInformationUserPage_homeTown.tr}: ${controller.sendNfcRequestModel.homeTownVMN}',
            Assets.ASSETS_SVG_ICON_NFC_HOME_TOWN_SVG),
        _buildItemText(
            '${LocaleKeys.nfcInformationUserPage_resident.tr}: ${controller.sendNfcRequestModel.residentVMN}',
            Assets.ASSETS_SVG_ICON_NFC_HOME_TOWN_SVG),
        _buildItemText(
            '${LocaleKeys.nfcInformationUserPage_identificationSigns.tr}: ${controller.sendNfcRequestModel.identificationSignsVNM}',
            Assets.ASSETS_SVG_ICON_NFC_IDENTIFYING_SIGNS_SVG),
        _buildItemText(
            '${LocaleKeys.nfcInformationUserPage_dateOfBirth.tr}: ${controller.dateOfBirth}',
            Assets.ASSETS_SVG_ICON_BIRTHDAY_SVG),
        _buildItemText(
            '${LocaleKeys.nfcInformationUserPage_dateOfExpiry.tr}: ${controller.dateOfExpiry}',
            Assets.ASSETS_SVG_ICON_CANLENDAR_CARD_SVG),
        _buildItemText(
            '${LocaleKeys.nfcInformationUserPage_registrationDate.tr}: ${controller.sendNfcRequestModel.registrationDateVMN}',
            Assets.ASSETS_SVG_ICON_CANLENDAR_CARD_SVG),
        _buildItemText(
            '${LocaleKeys.nfcInformationUserPage_nameDad.tr}: ${controller.sendNfcRequestModel.nameDadVMN}',
            Assets.ASSETS_SVG_ICON_USER_NAME_CARD_SVG),
        _buildItemText(
            '${LocaleKeys.nfcInformationUserPage_nameMom.tr}: ${controller.sendNfcRequestModel.nameMomVMN}',
            Assets.ASSETS_SVG_ICON_USER_NAME_CARD_SVG),
        (controller.sendNfcRequestModel.nameCouple != "" &&
                controller.sendNfcRequestModel.nameCouple != null)
            ? _buildItemText(
                '${controller.sendNfcRequestModel.sex == "M" ? "Tên vợ:" : "Tên chồng:"} ${controller.sendNfcRequestModel.nameCouple ?? ""}',
                Assets.ASSETS_SVG_ICON_USER_NAME_CARD_SVG)
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

Widget _buildItemText(String title, String assetIcon) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildBaseIcon(assetIcon).paddingOnly(right: AppDimens.padding5),
          Expanded(
            child: buildBaseText(title),
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
