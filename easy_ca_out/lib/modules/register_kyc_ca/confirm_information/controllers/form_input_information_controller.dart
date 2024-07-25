import 'package:easy_ca/generated/locales.g.dart';
import 'package:easy_ca/modules/register_kyc_ca/confirm_information/confirm_information_src.dart';
import 'package:easy_ca/shares/shares.src.dart';
import 'package:flutter/material.dart';

mixin FormInputInformationController {
  void insertFormInformation(ConfirmInformationController controller) {
    controller.listFormInput.add(
      FormInputInformationModel(
        title: "${LocaleKeys.registerCa_nameUser.tr}:",
        hintText: LocaleKeys.registerCa_nameUser.tr,
        textEditing: controller.textEditingName,
        focusNode: controller.nameFocus,
        nextFocus: controller.releasedByFocus,
      ),
    );
    controller.listFormInput.add(
      FormInputInformationModel(
        title: "${LocaleKeys.registerCa_nationalIDNumber.tr}:",
        hintText: LocaleKeys.registerCa_nationalIDNumber.tr,
        textEditing: controller.textEditingCCCD,
      ),
    );
    controller.listFormInput.add(
      FormInputInformationModel(
        title: "${LocaleKeys.registerCa_issuingAuthority.tr}:",
        hintText: LocaleKeys.registerCa_issuingAuthority.tr,
        textEditing: controller.textEditingIssuingAuthority,
        focusNode: controller.releasedByFocus,
        nextFocus: controller.birthplaceFocus,
      ),
    );
    controller.listFormInput.add(
      FormInputInformationModel(
        title: "${LocaleKeys.registerCa_documentAddress.tr}:",
        hintText: LocaleKeys.registerCa_documentAddress.tr,
        textEditing: controller.textEditingHomeTown,
        focusNode: controller.birthplaceFocus,
        nextFocus: controller.permanentAddressFocus,
      ),
    );
    controller.listFormInput.add(
      FormInputInformationModel(
        title: "${LocaleKeys.registerCa_contactAddress.tr}:",
        hintText: LocaleKeys.registerCa_contactAddress.tr,
        textEditing: controller.textEditingPermanentAddress,
        focusNode: controller.permanentAddressFocus,
        nextFocus: controller.phoneFocus,
      ),
    );
    controller.listFormInput.add(
      FormInputInformationModel(
          title: "${LocaleKeys.registerCa_numberPhone.tr}:",
          hintText: LocaleKeys.registerCa_numberPhone.tr,
          textEditing: controller.textEditingNumberPhone,
          inputFormatters: 8,
          focusNode: controller.phoneFocus,
          nextFocus: controller.emailFocus,
          textInputType: TextInputType.phone),
    );
    controller.listFormInput.add(
      FormInputInformationModel(
        title: "${LocaleKeys.registerCa_email.tr}:",
        hintText: LocaleKeys.registerCa_email.tr,
        textEditing: controller.textEditingEmail,
        inputFormatters: InputFormatterEnum.email,
        focusNode: controller.emailFocus,
        iconNextTextInputAction: TextInputAction.done,
        textInputType: TextInputType.emailAddress,
        onEditingComplete: controller.updateORCData,
      ),
    );
  }

  void initData(ConfirmInformationController controller) {
    controller.textEditingCCCD.text =
        controller.appController.sendNfcRequestGlobalModel.number ??
            controller.appController.infoORCRequest.number ??
            "";
    controller.textEditingName.text =
        controller.appController.sendNfcRequestGlobalModel.nameVNM ??
            controller.appController.infoORCRequest.name ??
            "";
    controller.textEditingIssuingAuthority.text =
        controller.appController.infoORCRequest.issueOrg ??
            LocaleKeys.nfcInformationUserPage_locationTitle.tr;
    controller.textEditingPermanentAddress.text =
        controller.appController.sendNfcRequestGlobalModel.residentVMN ??
            controller.appController.infoORCRequest.por ??
            "";
    controller.textEditingHomeTown.text =
        controller.appController.sendNfcRequestGlobalModel.homeTownVMN ??
            controller.appController.infoORCRequest.poo ??
            "";
    controller.textEditingNumberPhone.text =
        controller.appController.authProfileRequestModel.phoneNumber ?? "";
    controller.textEditingEmail.text =
        controller.appController.authProfileRequestModel.email ?? "";
    controller.textDateOfBirth.value =
        controller.appController.sendNfcRequestGlobalModel.dobVMN ??
            controller.appController.infoORCRequest.dob ??
            "";
    controller.textDateOfExpiration.value =
        controller.appController.sendNfcRequestGlobalModel.doeVMN ??
            controller.appController.infoORCRequest.doe ??
            "";
    controller.textDateOfIssue.value = controller
            .appController.sendNfcRequestGlobalModel.registrationDateVMN ??
        controller.appController.infoORCRequest.issueDate ??
        "";
    if (controller.appController.sendNfcRequestGlobalModel.sexVMN != null) {
      controller.textSex.value =
          controller.appController.sendNfcRequestGlobalModel.sexVMN == "Nam"
              ? LocaleKeys.nfcInformationUserPage_sexM.tr
              : LocaleKeys.nfcInformationUserPage_sexF.tr;
    } else {
      controller.textSex.value =
          controller.appController.infoORCRequest.sex == "Nam"
              ? LocaleKeys.nfcInformationUserPage_sexM.tr
              : LocaleKeys.nfcInformationUserPage_sexF.tr;
    }
  }
}
