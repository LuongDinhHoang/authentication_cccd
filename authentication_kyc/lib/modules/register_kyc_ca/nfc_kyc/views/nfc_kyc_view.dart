part of 'nfc_kyc_page.dart';

Widget _body(ScanNfcKycController controller) {
  return SizedBox(
    height: Get.height,
    width: Get.width,
    child: Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        BaseFormLogin.buildInputData(
                          title: "Số CCCD:",
                          textEditingController:
                              controller.idDocumentController,
                          isLoading: true,
                          hintText: "",
                          textInputType: TextInputType.number,
                          currentNode: controller.idDocumentFocus,
                          errorValidator:
                              LocaleKeys.register_account_errorValidatorCCCD.tr,
                          onValidator: (text) => UtilWidget.validateId(text),
                          fillColor: AppColors.basicWhite.obs,
                          autoFocus: true,
                        ),
                        Visibility(
                          visible: controller.userNameController.text != "" &&
                              controller.dobController.text != "",
                          child: Column(
                            children: [
                              BaseFormLogin.buildInputData(
                                title: "Họ và tên:",
                                textEditingController:
                                    controller.userNameController,
                                isLoading: true,
                                hintText: "",
                                textInputType: TextInputType.number,
                                currentNode: controller.userNameFocus,
                                errorValidator: LocaleKeys
                                    .register_account_errorValidatorCCCD.tr,
                                onValidator: (text) =>
                                    UtilWidget.validateId(text),
                                fillColor: AppColors.basicWhite.obs,
                                autoFocus: true,
                              ),
                              BaseFormLogin.buildInputData(
                                title: "Ngày sinh:",
                                textEditingController: controller.dobController,
                                isLoading: true,
                                hintText: "",
                                textInputType: TextInputType.number,
                                currentNode: controller.dobFocus,
                                errorValidator: LocaleKeys
                                    .register_account_errorValidatorCCCD.tr,
                                onValidator: (text) =>
                                    UtilWidget.validateId(text),
                                fillColor: AppColors.basicWhite.obs,
                                autoFocus: true,
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                _titleInstruct(),
              ],
            ).paddingAll(AppDimens.padding15),
          ),
        ),
        _buildButtonNfcContinue(controller),
      ],
    ),
  );
}

Widget _titleInstruct() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      sdsSB5,
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: TextUtils(
              text: LocaleKeys.update_information_kyc_Number1.tr,
              availableStyle: StyleEnum.bodyRegular,
              color: AppColors.basicBlack,
            ),
          ),
          Expanded(
            child: TextUtils(
              text: LocaleKeys.nfc_Step1.tr,
              size: AppDimens.sizeTextSmallTb,
              fontWeight: FontWeight.w400,
              color: AppColors.basicBlack,
              maxLine: 4,
            ),
          ),
        ],
      ),
      sdsSB5,
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: TextUtils(
              text: LocaleKeys.update_information_kyc_Number2.tr,
              size: AppDimens.sizeTextSmallTb,
              fontWeight: FontWeight.w400,
              color: AppColors.basicBlack,
            ),
          ),
          Expanded(
            child: TextUtils(
              text: LocaleKeys.nfc_Step2.tr,
              size: AppDimens.sizeTextSmallTb,
              fontWeight: FontWeight.w400,
              color: AppColors.basicBlack,
              maxLine: 2,
            ),
          ),
        ],
      ),
      sdsSB5,
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: TextUtils(
              text: LocaleKeys.update_information_kyc_Number3.tr,
              size: AppDimens.sizeTextSmallTb,
              fontWeight: FontWeight.w400,
              color: AppColors.basicBlack,
            ),
          ),
          Expanded(
            child: TextUtils(
              text: LocaleKeys.nfc_Step3.tr,
              size: AppDimens.sizeTextSmallTb,
              fontWeight: FontWeight.w400,
              color: AppColors.basicBlack,
              maxLine: 2,
            ),
          ),
        ],
      ),
    ],
  ).paddingOnly(bottom: AppDimens.padding5);
}

Widget _buildButtonNfcContinue(ScanNfcKycController controller) {
  return Column(
    children: [
      ButtonUtils.buildButton(LocaleKeys.nfc_buttonStart.tr, () async {
        ShowDialog.funcOpenDialog(const NfcDialog());
      },
              isLoading: controller.isShowLoading.value,
              backgroundColor: AppColors.primaryBlue1,
              borderRadius: BorderRadius.circular(AppDimens.radius4),
              colorText: AppColors.basicWhite)
          .paddingAll(AppDimens.padding15),
      // Obx(
      //   () => ButtonUtils.buildButton(
      //     LocaleKeys.nfc_buttonSkip.tr,
      //     () async {
      //       await controller.getInfoORC();
      //     },
      //     isLoading: controller.isShowLoading.value,
      //     backgroundColor: AppColors.colorTransparent,
      //     border: Border.all(width: 1, color: AppColors.primaryCam1),
      //     borderRadius: BorderRadius.circular(AppDimens.radius4),
      //     colorText: AppColors.primaryCam1,
      //   ).paddingAll(AppDimens.padding15),
      // ),
    ],
  );
}
