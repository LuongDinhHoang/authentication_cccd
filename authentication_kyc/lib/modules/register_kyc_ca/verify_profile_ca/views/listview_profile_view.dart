part of 'verify_profile_page.dart';

Widget _buildListViewProfile(VerifyProfileController controller) {
  return Obx(
    () => controller.listAuthProfileModel.isNotEmpty
        ? SingleChildScrollView(
            child: Column(children: [
              ...List.generate(
                controller.listAuthProfileModel.length,
                (index) => _buildItemInfo(
                  controller.listAuthProfileModel[index],
                  controller,
                  index,
                ).paddingOnly(
                  left: AppDimens.padding16,
                  bottom: AppDimens.padding16,
                  right: AppDimens.padding16,
                ),
              ),
              const SizedBox(
                height: AppDimens.scrollPaddingDefault,
              )
            ]),
          )
        : UtilWidget.buildEmptyList(),
  );
}

// Widget _buildListAuth(VerifyProfileController controller) {
//   return controller.listAuthProfileModel.isNotEmpty
//       ? SingleChildScrollView(
//           child: Column(
//             children: List.generate(
//               controller.listAuthProfileModel.length,
//               (index) => _buildItemInfo(
//                 controller.listAuthProfileModel[index],
//                 controller,
//                 index,
//               ).paddingOnly(
//                 left: AppDimens.padding16,
//                 bottom: AppDimens.padding16,
//                 right: AppDimens.padding16,
//               ),
//             ),
//           ),
//         )
//       : _buildListNull();
// }

// Center _buildListNull() {
//   return Center(
//     child: SvgPicture.asset(Assets.ASSETS_SVG_ICON_LIST_NULL_SVG),
//   );
// }

Widget _buildItemInfo(AuthProfileResponseModel authProfileResponseModel,
    VerifyProfileController controller, int index) {
  bool isSelect = controller.indexListAuth.value == index;
  return InkWell(
    onTap: () {
      controller.indexListAuth.value = index;
    },
    child: Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.radius4),
        border: Border.all(
            color: isSelect ? AppColors.primaryBlue1 : AppColors.basicGrey2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sdsSBDefault,
          TextUtils(
            text:
                "${LocaleKeys.registerCa_profileCreateToken.tr} ${authProfileResponseModel.tokenType ?? ""}",
            availableStyle: StyleEnum.bodyBold,
            color: AppColors.basicBlack,
          ),
          sdsSB5,
          _buildItemCard(Assets.ASSETS_SVG_ICON_CARD_INFO_SVG,
              authProfileResponseModel.identity ?? ""),
          sdsSB5,
          _buildItemCard(Assets.ASSETS_SVG_ICON_USER_NAME_CARD_SVG,
              '${LocaleKeys.registerCa_userName.tr}: ${authProfileResponseModel.name}'),
          sdsSB5,
          _buildItemCard(Assets.ASSETS_SVG_ICON_CANLENDAR_CARD_SVG,
              '${LocaleKeys.registerCa_dateCreate.tr}: ${authProfileResponseModel.registerTime}'),
          // sdsSB5,
          // _buildItemCard(Assets.ASSETS_SVG_ICON_CANLENDAR_CARD_SVG,
          //     '${LocaleKeys.registerCa_registrationDeadline.tr}: ${authProfileResponseModel.serviceExpiry} ${LocaleKeys.registerCa_month.tr}'),
          sdsSB5,
          //
          _buildItemCard(
              Assets.ASSETS_SVG_ICON_PACKAGE_SVG,
              '${LocaleKeys.registerCa_service_package.tr}: ${controller.capitalizeFirstLetter(
                controller.nameServicePackage(
                    ServiceTypeEnum.mapServiceType[
                            authProfileResponseModel.serviceType] ??
                        "",
                    authProfileResponseModel.serviceExpiry ?? ""),
              )}'),
          //
          _buildItemCard(Assets.ASSETS_SVG_ICON_NUMBER_PHONE_SVG,
              '${LocaleKeys.registerCa_numberPhone.tr}: ${authProfileResponseModel.phoneNumber}'),
          sdsSB5,
          _buildItemCard(Assets.ASSETS_SVG_ICON_EMAIL_SVG,
              '${LocaleKeys.registerCa_email.tr}: ${authProfileResponseModel.email}'),
          sdsSB5,
        ],
      ).paddingSymmetric(horizontal: AppDimens.padding12),
    ),
  );
}

Widget _buildItemCard(String icon, String content) {
  return Row(
    children: [
      SvgPicture.asset(icon),
      sdsSBWidth5,
      TextUtils(
        text: content,
        availableStyle: StyleEnum.bodyRegular,
      )
    ],
  );
}

Widget _buildPermission(VerifyProfileController controller) {
  return Obx(
    () => Visibility(
      visible: controller.currentPageIndex.value == 1,
      child: SizedBox(
        width: Get.width,
        height: AppDimens.height110,
        child: Column(
          children: [
            UtilWidget.buildPermission(controller.isPermission),
            sdsSBDefault,
            ButtonUtils.buildButton(
              LocaleKeys.registerCa_continue.tr,
              () async {
                if (controller.isPermission.value &&
                    controller.listAuthProfileModel.isNotEmpty) {
                  await controller.appAcceptTerms().whenComplete(
                        () => controller.hideLoading(),
                      );
                }
              },
              isLoading: controller.isShowLoading.value,
              backgroundColor: controller.getColorButton(),
              borderRadius: BorderRadius.circular(AppDimens.radius4),
              height: AppDimens.iconHeightButton,
            ).paddingSymmetric(horizontal: AppDimens.paddingDefaultHeight),
          ],
        ),
      ),
    ),
  );
}
