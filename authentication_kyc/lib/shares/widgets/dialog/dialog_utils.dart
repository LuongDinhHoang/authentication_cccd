import 'package:app_settings/app_settings.dart';
import 'package:two_id_c06verify/assets.dart';
import 'package:two_id_c06verify/core/core.src.dart';
import 'package:two_id_c06verify/generated/locales.g.dart';
import 'package:two_id_c06verify/shares/shares.src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ShowDialog {
  static int _numberOfDialogs = 0;

  static void dismissDialog() {
    if (_numberOfDialogs > 0) {
      Get.back();
    }
  }

  static void _showDialog(Widget dialog, bool isActiveBack,
      {Function? onBackPress}) {
    Get.dialog(
      PopScope(
        onPopInvoked: (bool didPop) =>
            onBackPress == null ? () {} : onBackPress(isActiveBack),
        canPop: isActiveBack,
        child: dialog,
      ),
      barrierDismissible: false,
    ).then((value) => _numberOfDialogs--);
    _numberOfDialogs++;
  }

  static void openAppSetting() {
    showDialogConfirm(
      LocaleKeys.dialog_permissionHelper.tr,
      actionTitle: LocaleKeys.dialog_openSettings.tr,
      confirm: () {
        AppSettings.openAppSettings();
        // Get.back();
      },
    );
  }

  static void showDialogConfirm(
    String content, {
    required Function confirm,
    required String actionTitle,
    bool isActiveBack = true,
    String title = LocaleKeys.dialog_notify,
    String exitTitle = LocaleKeys.dialog_cancel,
    Function? cancelFunc,
    bool isAutoCloseDialog = false,
  }) {
    _showDialog(
      Dialog(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.padding10),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: AppDimens.padding16),
                child: TextUtils(
                  text: title.tr,
                  availableStyle: StyleEnum.bodyBold,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(AppDimens.padding16),
                constraints: const BoxConstraints(maxHeight: 200),
                child: SingleChildScrollView(
                  child: TextUtils(
                    text: content,
                    availableStyle: StyleEnum.bodyRegular,
                    color: AppColors.colorBlack,
                    textAlign: TextAlign.center,
                    maxLine: 4,
                  ),
                ),
              ),
              const Divider(
                height: 1,
              ),
              SizedBox(
                width: double.infinity,
                height: AppDimens.btnMedium,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ButtonUtils.baseButton(cancelFunc, exitTitle.tr),
                    ),
                    const VerticalDivider(
                      width: 1,
                    ),
                    Expanded(
                      child: ButtonUtils.baseButton(confirm, actionTitle),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      isActiveBack,
    );
  }

  static void showDialogNotification(
    String content, {
    required Function confirm,
    required String actionTitle,
    bool isActiveBack = true,
    String titleButton = "",
    String title = LocaleKeys.dialog_notify,
    bool isAutoCloseDialog = false,
  }) {
    _showDialog(
      Dialog(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.padding10),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SvgPicture.asset(
                Assets.ASSETS_SVG_ICON_CHECKMARK_SVG,
                width: AppDimens.iconCheckmark,
                height: AppDimens.iconCheckmark,
              ).paddingOnly(
                top: AppDimens.padding16,
                bottom: AppDimens.padding5,
              ),
              TextUtils(
                text: title.tr,
                availableStyle: StyleEnum.heading1Bold,
              ),
              sdsSBDefault,
              TextUtils(
                text: content,
                availableStyle: StyleEnum.bodyBold,
                color: AppColors.basicBlack,
                maxLine: 2,
                textAlign: TextAlign.center,
              ).paddingSymmetric(horizontal: AppDimens.padding5),
              const SizedBox(
                height: AppDimens.padding20,
              ),
              ButtonUtils.buildButton(
                titleButton,
                confirm,
                backgroundColor: AppColors.primaryCam1,
                height: AppDimens.iconHeightButton,
              ).paddingSymmetric(horizontal: AppDimens.padding16),
              const SizedBox(
                height: AppDimens.padding16,
              )
            ],
          ),
        ),
      ),
      isActiveBack,
    );
  }

  static void dialogBase({
    required Widget icon,
    required String title,
    required String content,
    required Function function,
    String? titleButton,
    bool isActiveBack = true,
  }) {
    _showDialog(
      Dialog(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.padding10),
        ),
        child: IntrinsicHeight(
          child: Column(
            children: [
              sdsSBHeight12,
              SizedBox(
                width: AppDimens.sizeImageMedium,
                height: AppDimens.sizeImageMedium,
                child: icon,
              ),
              sdsSBHeight12,
              TextUtils(
                text: title,
                maxLine: 3,
                availableStyle: StyleEnum.subBold,
                textAlign: TextAlign.center,
              ),
              sdsSB8,
              TextUtils(
                text: content,
                maxLine: 3,
                availableStyle: StyleEnum.bodyRegular,
                textAlign: TextAlign.center,
              ).paddingSymmetric(horizontal: AppDimens.padding16),
              sdsSBPadding,
              ButtonUtils.buildButton(
                titleButton ?? LocaleKeys.registerCa_continue.tr,
                function,
                backgroundColor: AppColors.primaryCam1,
                borderRadius: BorderRadius.circular(AppDimens.radius4),
                height: AppDimens.iconHeightButton,
              ).paddingSymmetric(
                horizontal: AppDimens.paddingDefaultHeight,
                vertical: AppDimens.padding10,
              ),
            ],
          ),
        ),
      ),
      isActiveBack,
    );
  }

  static Future<void> funcOpenDialog(Widget child) async {
    Get.dialog(
      buildShowPopupOption(child),
      barrierDismissible: false,
    );
  }

  static Widget buildShowPopupOption(Widget? child) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            12,
          ),
        ),
      ),
      backgroundColor: AppColors.basicWhite,
      contentPadding: const EdgeInsets.all(0),
      elevation: 0.0,
      content: SizedBox(
        width: Get.width,
        child: child,
      ),
    );
  }

  static void successDialog(String title) {
    _showDialog(successDialogWidget(title), true);
  }

  static Widget successDialogWidget(String title) {
    return Dialog(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.padding10),
        ),
        child: SizedBox(
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                Assets.ASSETS_SVG_ICON_SUCCESS_SVG,
                colorFilter: const ColorFilter.mode(
                  AppColors.primaryCam1,
                  BlendMode.srcIn,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: TextUtils(
                  text: title,
                  availableStyle: StyleEnum.bodyRegular,
                  color: AppColors.basicBlack,
                  maxLine: 2,
                ),
              ).paddingOnly(
                  top: AppDimens.padding20,
                  bottom: AppDimens.padding10,
                  left: AppDimens.padding10,
                  right: AppDimens.padding10),
            ],
          ),
        ));
  }

  /// Hiển thị dialog thông báo với nội dung cần hiển thị
  ///
  /// `funtion` hành động khi bấm đóng
  ///
  /// `isActiveBack` có cho phép back từ bàn phím Android hay không, default = true
  ///
  /// `isChangeContext` default true: khi gọi func không close dialog hiện tại (khi chuyển sang màn mới thì dialog hiện tại sẽ tự đóng)
  static void showDialogNotificationError(
    String content, {
    bool isActiveBack = true,
    Function? function,
    String nameAction = LocaleKeys.dialog_close,
    bool isExpiredToken = false,
  }) {
    _showDialog(
        Dialog(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 15, bottom: 10),
                  child: Icon(
                    _buildIconDialog(content),
                    size: AppDimens.btnMediumTb,
                    color: Colors.blueAccent,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15.0),
                  constraints: const BoxConstraints(maxHeight: 200),
                  child: SingleChildScrollView(
                    child: TextUtils(
                      text: content,
                      availableStyle: StyleEnum.bodyRegular,
                      color: AppColors.primaryNavy,
                      textAlign: TextAlign.center,
                      maxLine: 6,
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                SizedBox(
                  width: double.infinity,
                  child: _baseButton(
                    function,
                    nameAction.tr,
                    colorText: AppColors.primaryNavy,
                  ),
                ),
              ],
            ),
          ),
        ),
        isActiveBack);
  }

  static Widget _baseButton(
    Function? function,
    String text, {
    Color? colorText,
  }) {
    return ButtonUtils.baseOnAction(
        onTap: () {
          dismissDialog();
          function?.call();
        },
        child: TextButton(
          onPressed: null,
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
          child: TextUtils(
            text: text,
            availableStyle: StyleEnum.bodyRegular,
            color: colorText ?? AppColors.primaryNavy,
          ),
        ));
  }

  static IconData _buildIconDialog(String errorStr) {
    IconData iconData;
    switch (errorStr) {
      case LocaleKeys.dialog_errorConnectTimeOut:
        iconData = Icons.alarm_off;
        break;
      case LocaleKeys.dialog_error400:
      case LocaleKeys.dialog_error401:
      case LocaleKeys.dialog_error404:
      case LocaleKeys.dialog_error502:
      case LocaleKeys.dialog_error503:
      case LocaleKeys.dialog_errorInternalServer:
        iconData = Icons.warning;
        break;
      case LocaleKeys.dialog_errorConnectFailedStr:
        iconData = Icons.signal_wifi_off;
        break;
      default:
        iconData = Icons.notifications_none;
    }
    return iconData;
  }

  static void showErrorMessage(String error, {bool isExpiredToken = false}) {
    if (_numberOfDialogs < 1) {
      if (isExpiredToken) {
        showDialogNotificationError(error,
            nameAction: LocaleKeys.dialog_confirm, function: () {
          Get.offAllNamed(AppRoutes.routeLogin);
        });
      } else {
        showDialogNotificationError(error, isActiveBack: false);
      }
    }
  }

  static void showDialogTimePicker({
    bool isActiveBack = true,
    Function? function,
    required DateTime? initDate,
    Function(Object?)? onSubmit,
  }) async {
    _showDialog(
        Dialog(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  height: 400,
                  child: Card(
                      child: SfDateRangePicker(
                    view: DateRangePickerView.month,
                    selectionMode: DateRangePickerSelectionMode.single,
                    backgroundColor: AppColors.basicWhite,
                    headerHeight: 50,
                    headerStyle: const DateRangePickerHeaderStyle(
                      textAlign: TextAlign.center,
                    ),
                    monthViewSettings: const DateRangePickerMonthViewSettings(
                        viewHeaderHeight: 40),
                    // initialSelectedRange:
                    // PickerDateRange(listRange[0], listRange[1]),
                    initialSelectedDate: initDate,
                    initialDisplayDate: initDate,
                    // showActionButtons: true,
                    showNavigationArrow: true,
                    showActionButtons: true,
                    // minDate: DateTime(2020),
                    // maxDate: DateTime(DateTime.now().year + 5),
                    cancelText: LocaleKeys.dialog_close.tr,
                    confirmText: LocaleKeys.dialog_confirm.tr,
                    onCancel: () => Get.back(),
                    onSubmit: onSubmit,
                    onSelectionChanged:
                        (DateRangePickerSelectionChangedArgs args) {},
                  )),
                ),
                // const Divider(
                //   height: 1,
                // ),
                // SizedBox(
                //   width: double.infinity,
                //   child: _baseButton(
                //     function,
                //     nameAction.tr,
                //     colorText: AppColors.colorBlueAccent,
                //   ),
                // ),
              ],
            ).paddingAll(5),
          ),
        ),
        isActiveBack);
  }
}
