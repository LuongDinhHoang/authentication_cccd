part of 'take_picture_card_kyc_page.dart';

Widget _body(TakePictureCardKycController controller) {
  return controller.imageTemp.value == null
      ? Stack(
          children: [
            SizedBox(
              height: Get.height,
              width: Get.width,
              child: Stack(
                fit: StackFit.passthrough,
                children: [
                  _buildCamera(controller),
                  CustomPaint(
                    painter: CustomShapePainterTakePicture(),
                  ),
                ],
              ),
            ),
            _itemBorder(controller),
          ],
        )
      : Stack(
          fit: StackFit.passthrough,
          children: [
            Positioned(
              left: AppDimens.padding25,
              right: AppDimens.padding25,
              top: Get.height / 4 - Get.height / 6 - AppDimens.padding40,
              child: TextUtils(
                text: controller.isTakeFront
                    ? LocaleKeys.take_picture_titleTakePictureFront.tr
                    : LocaleKeys.take_picture_titleTakePictureBack.tr,
                availableStyle: StyleEnum.subBold,
                color: AppColors.basicBlack,
              ),
            ),
            Positioned(
              left: AppDimens.padding25,
              right: AppDimens.padding25,
              top: Get.height / 4 - Get.height / 6,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.basicWhite),
                    borderRadius: BorderRadius.circular(AppDimens.radius18)),
                child: Screenshot(
                  controller: controller.screenshotControllerResult,
                  child: SizedBox(
                    width: Get.size.width - AppDimens.padding50,
                    height: Get.size.height / 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppDimens.radius18),
                      child: OverflowBox(
                        maxWidth: Get.size.width - AppDimens.padding50,
                        maxHeight: Get.size.height - AppDimens.padding50,
                        child: Transform.scale(
                          scale: AppDimens.scale08,
                          child: Transform.rotate(
                            angle: -pi / 2,
                            child: FractionalTranslation(
                              translation: const Offset(0.00, 0.01),
                              child: Image.memory(
                                controller.imageTemp.value!,
                                fit: BoxFit.cover,
                                // fit: BoxFit.cover,
                              ).paddingSymmetric(horizontal: AppDimens.padding20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: AppDimens.padding25,
              right: AppDimens.padding25,
              bottom: AppDimens.padding15,
              child: _buildButtonConfirm(controller),
            ),
            iconBorderPosition(
              top: Get.height / 4 - Get.height / 6,
              left: AppDimens.padding25,
              transform: Matrix4.rotationY(0),
              assets: Assets.ASSETS_SVG_ICON_BORDER_TOP_LEFT_CAP_SVG,
            ),
            iconBorderPosition(
              top: Get.height / 4 - Get.height / 6,
              right: AppDimens.padding25,
              transform: Matrix4.rotationY(pi),
              assets: Assets.ASSETS_SVG_ICON_BORDER_TOP_LEFT_CAP_SVG,
              // isBottomLeft: true,
            ),
            iconBorderPosition(
              top: Get.height / 4 + Get.height / 6 - AppDimens.padding78,
              left: AppDimens.padding25,
              transform: Matrix4.rotationX(pi),
              assets: Assets.ASSETS_SVG_ICON_BORDER_TOP_LEFT_CAP_SVG,
            ),
            iconBorderPosition(
              top: Get.height / 4 + Get.size.height / 6 - AppDimens.padding78,
              right: AppDimens.padding25,
              transform: Matrix4.rotationZ(pi),
              assets: Assets.ASSETS_SVG_ICON_BORDER_TOP_LEFT_CAP_SVG,
              // isBottomLeft: true,
            ),
          ],
        );
}

Widget _itemBorder(TakePictureCardKycController controller) {
  return Stack(
    children: [
      Positioned(
        left: AppDimens.padding40,
        right: AppDimens.padding40,
        top: AppDimens.padding50,
        child: GestureDetector(
          onTap: () {
            controller.toggleFlash();
          },
          child: Align(
            alignment: Alignment.topLeft,
            child: SvgPicture.asset(
              controller.isFlashOn.value
                  ? Assets.ASSETS_SVG_ICON_FLASH_SVG
                  : Assets.ASSETS_SVG_ICON_FLASH_OFF_SVG,
            ),
          ),
        ),
      ),
      Positioned(
        left: AppDimens.padding40,
        right: AppDimens.padding40,
        top: AppDimens.padding50,
        child: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(Assets.ASSETS_SVG_ICON_CANCEL_SVG),
          ),
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: RotatedBox(
            quarterTurns: 1,
            child: TextUtils(
              text: LocaleKeys.take_picture_title.tr,
              availableStyle: StyleEnum.bodyRegular,
              color: AppColors.basicWhite,
            )),
      ).paddingOnly(left: AppDimens.padding10),
      Align(
        alignment: Alignment.centerRight,
        child: RotatedBox(
          quarterTurns: 1,
          child: TextUtils(
            text: controller.isTakeFront
                ? LocaleKeys.take_picture_titleTakeFront.tr
                : LocaleKeys.take_picture_titleTakeBack.tr,
            availableStyle: StyleEnum.bodyRegular,
            color: AppColors.basicWhite,
          ),
        ).paddingOnly(right: AppDimens.padding10),
      ),
      iconBorderPosition(
        top: Get.height / 2 - Get.height / 3,
        left: AppDimens.padding40,
        transform: Matrix4.rotationY(0),
      ),
      iconBorderPosition(
        top: Get.height / 2 - Get.height / 3,
        right: AppDimens.padding40,
        transform: Matrix4.rotationY(pi),
        // isBottomLeft: true,
      ),
      iconBorderPosition(
        bot: Get.height / 2 - Get.height / 3,
        left: AppDimens.padding40,
        transform: Matrix4.rotationX(pi),
      ),
      iconBorderPosition(
        bot: Get.height / 2 - Get.height / 3,
        right: AppDimens.padding40,
        transform: Matrix4.rotationZ(pi),
        // isBottomLeft: true,
      ),
      Positioned(
        left: AppDimens.padding40,
        right: AppDimens.padding40,
        bottom: AppDimens.padding15,
        child: GestureDetector(
          onTap: () async {
            await controller.takePictureScreen();
          },
          child: Center(
            child: SvgPicture.asset(Assets.ASSETS_SVG_ICON_TAKE_PICTURE_SVG),
          ),
        ),
      ),
    ],
  );
}

Widget iconBorderPosition({
  double? top,
  double? bot,
  double? left,
  double? right,
  String? assets,
  required Matrix4 transform,
}) {
  return Positioned(
    top: top,
    left: left,
    right: right,
    bottom: bot,
    child: Transform(
        alignment: Alignment.center,
        transform: transform,
        child: SvgPicture.asset(
            assets ?? Assets.ASSETS_SVG_ICON_BORDER_TOP_LEFT_SVG)),
  );
}

Widget _buildButtonConfirm(TakePictureCardKycController controller) {
  return Row(
    children: [
      Expanded(
        child: ButtonUtils.buildButton(
          LocaleKeys.take_picture_cancel.tr,
          () async {
            controller.retakePicture();
          },
          width: Get.width / 3,
          // isLoading: controller.isShowLoading.value,
          backgroundColor: AppColors.colorTransparent,
          border: Border.all(width: 1, color: AppColors.primaryBlue1),
          borderRadius: BorderRadius.circular(AppDimens.radius4),
          colorText: AppColors.primaryBlue1,
        ),
      ),
      sdsSBWidth15,
      Expanded(
        child: ButtonUtils.buildButton(LocaleKeys.take_picture_confirm.tr,
            () async {
          controller.takePictureScreenResult();
        },
            width: Get.width / 3,
            isLoading: controller.isShowLoading.value,
            backgroundColor: AppColors.primaryBlue1,
            borderRadius: BorderRadius.circular(AppDimens.radius4),
            colorText: AppColors.basicWhite),
      ),
    ],
  );
}

Screenshot _buildCamera(TakePictureCardKycController controller) {
  return Screenshot(
    controller: controller.screenshotController,
    child: CameraPreview(controller.cameraController),
  );
}
