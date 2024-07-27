part of 'confirm_information_page.dart';

Widget _buildFormInput(ConfirmInformationController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextUtils(
        text: LocaleKeys.registerCa_step2ConfirmInform.tr,
        availableStyle: StyleEnum.subBold,
        color: AppColors.basicBlack,
      ),
      TextUtils(
        text: LocaleKeys.registerCa_infoCard.tr,
        availableStyle: StyleEnum.bodyBold,
        color: AppColors.basicBlack,
      ).paddingOnly(top: AppDimens.padding15),
      _buildListViewItem(controller),
    ],
  ).paddingSymmetric(horizontal: AppDimens.padding16);
}

Widget _buildListViewItem(ConfirmInformationController controller) {
  return Expanded(
    child: SingleChildScrollView(
      child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            ...List.generate(
              controller.listFormInput.length,
              (index) => _buildItemInput(index, controller),
            ),
            sdsSBHeight20,
            Obx(
              () => ButtonUtils.buildButton(
                LocaleKeys.registerCa_continue.tr,
                () async {
                  await controller.updateORCData();
                },
                isLoading: controller.isShowLoading.value,
                backgroundColor: AppColors.primaryCam1,
                borderRadius: BorderRadius.circular(AppDimens.radius4),
                height: AppDimens.iconHeightButton,
              ),
            ),
            sdsSBDefault,
          ],
        ),
      ),
    ),
  );
}

Column _buildItemInput(int index, ConfirmInformationController controller) {
  return Column(
    children: [
      Visibility(
        visible: index == 1, // vị trí 1 để hiển thị nhập thời gian
        child: _buildRowItem(controller),
      ),
      Visibility(
        visible: index == 5,
        child: Align(
          alignment: Alignment.centerLeft,
          child: TextUtils(
            text: LocaleKeys.registerCa_titleContact.tr,
            availableStyle: StyleEnum.bodyBold,
            color: AppColors.basicBlack,
            textAlign: TextAlign.left,
          ).paddingOnly(top: AppDimens.padding15),
        ),
      ),
      _buildItemFrom(
        text: controller.listFormInput[index].title,
        hintText: controller.listFormInput[index].hintText,
        textEditing: controller.listFormInput[index].textEditing,
        isEnable: controller.listFormInput[index].isEnable,
        inputFormatters: controller.listFormInput[index].inputFormatters,
        textInputType: controller.listFormInput[index].textInputType,
        currentNode:
            controller.listFormInput[index].focusNode ?? FocusNode().obs,
        nextFocus: controller.listFormInput[index].nextFocus ?? FocusNode().obs,
        iconNextTextInputAction:
            controller.listFormInput[index].iconNextTextInputAction,
        onEditingComplete: controller.listFormInput[index].onEditingComplete,
      ),
    ],
  );
}

Widget _buildRowItem(ConfirmInformationController controller) {
  return Obx(
    () => Column(
      children: [
        Row(
          children: [
            _buildItemDate(
              "${LocaleKeys.registerCa_dateOfBirthday.tr}:",
              controller.textDateOfBirth.value,
              AppConst.typeDateOfBirth,
              controller,
            ),
            sdsSBWidth16,
            _buildDropdown(
              LocaleKeys.registerCa_gender.tr,
              controller,
            ),
          ],
        ),
        sdsSBHeight10,

        /// View giao diện
        Visibility(
          visible: controller.textDateOfBirth.value.isNotEmpty,
          child: sdsSBHeight10,
        ),
        Row(
          children: [
            _buildItemDate(
              "${LocaleKeys.registerCa_dateOfIssue.tr}:",
              controller.textDateOfIssue.value,
              AppConst.typeDateIssue,
              controller,
              contentRow: controller.textDateOfExpiration.value,
            ),
            sdsSBWidth16,
            _buildItemDate(
              "${LocaleKeys.registerCa_expirationDate.tr}:",
              controller.textDateOfExpiration.value,
              AppConst.typeDateOfExpiration,
              controller,
              contentRow: controller.textDateOfIssue.value,
            ),
          ],
        ),
      ],
    ).paddingSymmetric(vertical: AppDimens.padding10),
  );
}

Widget _buildDropdown(String text, ConfirmInformationController controller) {
  return Expanded(
    child: Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TextUtils(
                text: "$text:",
                availableStyle: StyleEnum.bodyRegular,
              ),
              const TextUtils(
                text: " *",
                color: AppColors.statusRed,
                availableStyle: StyleEnum.bodyRegular,
              ),
            ],
          ).paddingOnly(bottom: AppDimens.padding5),
          Container(
            height: AppDimens.padding40,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.primaryNavy),
                borderRadius: BorderRadius.circular(AppDimens.radius4)),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: AppDimens.padding10),
                child: DropdownBase.baseDropDow(
                  mapData: ConfirmInformationCollection.listTypeSex,
                  isUseKey: true,
                  item: controller.textSex,
                  hint: text,
                  onChanged: (newValue) {
                    controller.textSex.value = newValue ?? "";
                    // controller.indexCategories = ComplainCollection
                    //         .listTypeComplainDropDow[newValue ?? ""] ??
                    //     0;
                  },
                ),
              ),
            ),
          ),

          /// View giao diện nếu giá trị ngày sinh null
          Visibility(
            visible: controller.textDateOfBirth.value.isEmpty &&
                controller.isValidate.value,
            child: const SizedBox(
              height: 23,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildItemDate(String text, String content, int type,
    ConfirmInformationController controller,
    {String? contentRow}) {
  Color borderColor = AppColors.primaryNavy;
  if (controller.isValidate.value) {
    borderColor = content.isEmpty ? AppColors.statusRed : AppColors.primaryNavy;
  }

  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TextUtils(
              text: text,
              availableStyle: StyleEnum.bodyRegular,
            ),
            const TextUtils(
              text: " *",
              color: AppColors.statusRed,
              availableStyle: StyleEnum.bodyRegular,
            ),
          ],
        ).paddingOnly(bottom: AppDimens.padding5),
        GestureDetector(
          onTap: () {
            controller.changDatePicker(type);
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            height: AppDimens.padding40,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: borderColor,
                ),
                borderRadius: BorderRadius.circular(AppDimens.radius4)),
            child: Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: AppDimens.padding10),
                      child: TextUtils(
                        text: content,
                        availableStyle: StyleEnum.bodyRegular,
                      ),
                    ),
                  ),
                ),
                const Icon(
                  Icons.calendar_month,
                  color: AppColors.basicBlack,
                ).paddingOnly(right: AppDimens.padding5),
              ],
            ),
          ),
        ),
        Visibility(
          visible: content.isEmpty && controller.isValidate.value,
          child: TextUtils(
            text:
                "${text.replaceAll(":", "")}${LocaleKeys.login_errorEmpty.tr}",
            availableStyle: StyleEnum.detailRegular,
            color: AppColors.statusRed,
          ).paddingOnly(left: AppDimens.padding12, top: AppDimens.padding5),
        ),

        /// View giao diện nếu giá trị null
        Visibility(
          visible: content.isNotEmpty &&
              contentRow != null &&
              (contentRow).isEmpty &&
              controller.isValidate.value,
          child: Container(
            height: AppDimens.padding22,
          ),
        ),
      ],
    ),
  );
}

Widget _buildItemFrom({
  required String text,
  required String hintText,
  required TextEditingController textEditing,
  required bool isEnable,
  Rx<FocusNode>? nextFocus,
  required Rx<FocusNode> currentNode,
  int inputFormatters = 0,
  TextInputType textInputType = TextInputType.text,
  TextInputAction iconNextTextInputAction = TextInputAction.next,
  VoidCallback? onEditingComplete,
}) {
  return SDSInputWithLabel(
    inputLabelModel: SDSInputLabelModel(
      label: text,
      paddingLabel: const EdgeInsets.symmetric(
        horizontal: 0,
        vertical: AppDimens.paddingDefault,
      ),
      styleEnum: StyleEnum.bodyRegular,
      isValidate: true,
      colorTextLabel: AppColors.basicBlack,
    ),
    inputTextFormModel: SDSInputTextModel(
      paddingModel: const EdgeInsets.symmetric(
        horizontal: 0,
      ),
      borderRadius: AppDimens.radius8,
      isShowCounterText: false,
      controller: textEditing,
      hintTextSize: AppDimens.sizeTextSmall,
      hintTextColor: AppColors.basicGrey2,
      hintText: hintText,
      contentPadding: const EdgeInsets.only(
        top: AppDimens.paddingDefault,
        bottom: AppDimens.paddingDefault,
        left: AppDimens.paddingDefault,
      ),
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimens.radius4),
        borderSide: const BorderSide(
          color: AppColors.primaryNavy,
        ),
      ),
      enable: isEnable,
      autoFocus: false,
      nextNode: (nextFocus?.value) ?? FocusNode(),
      focusNode: currentNode.value,
      inputFormatters: inputFormatters,
      iconNextTextInputAction: iconNextTextInputAction,
      textInputType: textInputType,
      onEditingComplete: onEditingComplete,
    ),
  );
}
