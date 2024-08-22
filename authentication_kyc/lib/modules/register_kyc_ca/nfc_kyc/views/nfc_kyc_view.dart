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
                const TextUtils(
                  text: "Thông tin cá nhân",
                  availableStyle: StyleEnum.bodyBold,
                  color: AppColors.primaryNavy,
                ),
                sdsSB8,
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
                          // onValidator: (text) => UtilWidget.validateId(text),
                          fillColor: AppColors.basicWhite.obs,
                          autoFocus: true,
                          paddingModel: const EdgeInsets.symmetric(),
                        ),
                        Visibility(
                          visible:
                              true /*controller.userNameController.text != "" &&
                              controller.dobController.text != ""*/
                          ,
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
                                // onValidator: (text) =>
                                //     UtilWidget.validateId(text),
                                fillColor: AppColors.basicWhite.obs,
                                autoFocus: true,
                                paddingModel: const EdgeInsets.symmetric(),
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
                                // onValidator: (text) =>
                                //     UtilWidget.validateId(text),
                                fillColor: AppColors.basicWhite.obs,
                                autoFocus: true,
                                paddingModel: const EdgeInsets.symmetric(),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                _buildButtonNfcContinue(controller),
                _titleInstruct(),
              ],
            ).paddingAll(AppDimens.padding15),
          ),
        ),
      ],
    ),
  );
}

Widget _titleInstruct() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      sdsSB5,
      TextUtils(
        text: "Hướng dẫn:",
        color: AppColors.colorDisable,
        availableStyle: StyleEnum.subBold,
        maxLine: 3,
      ),
      sdsSB5,
      TextUtils(
        text: "Bước 1: Đặt mã QR trên thẻ CCCD vào vị trí khung",
        color: AppColors.colorDisable,
        availableStyle: StyleEnum.bodyRegular,
        maxLine: 3,
      ),
      sdsSB5,
      TextUtils(
        text:
            "Bước 2: Chờ hệ thống định danh và xác thực cho tới khi có thông báo thành công.",
        color: AppColors.colorDisable,
        availableStyle: StyleEnum.bodyRegular,
        maxLine: 3,
      ),
    ],
  ).paddingOnly(bottom: AppDimens.padding5);
}

Widget _buildButtonNfcContinue(ScanNfcKycController controller) {
  return Column(
    children: [
      ButtonUtils.buildButton("Quét chip với NFC", () async {
        await controller.scanNfc();
      },
              isLoading: controller.isShowLoading.value,
              backgroundColor: AppColors.primaryBlue1,
              colorText: AppColors.basicWhite)
          .paddingAll(AppDimens.padding15),
    ],
  );
}
