import 'dart:typed_data';
import 'package:two_id_c06verify/modules/register_kyc_ca/confirm_information/repository/confirm_info_repository.dart';
import 'package:two_id_c06verify/modules/register_kyc_ca/service_package/service_package_src.dart';
import 'package:two_id_c06verify/modules/register_kyc_ca/verify_profile_ca/verify_profile_ca_src.dart';
import 'package:image/image.dart' as img;

import 'package:two_id_c06verify/base_app/base_app.src.dart';
import 'package:two_id_c06verify/core/base/base.src.dart';
import 'package:two_id_c06verify/core/core.src.dart';
import 'package:two_id_c06verify/generated/locales.g.dart';
import 'package:two_id_c06verify/shares/shares.src.dart';
import 'package:two_id_c06verify/shares/utils/time/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

import '../confirm_information_src.dart';
import 'form_input_information_controller.dart';

class ConfirmInformationController extends BaseGetxController
    with FormInputInformationController {
  PageController pageViewController = PageController();
  AppController appController = Get.find<AppController>();
  RxInt currentPageIndex = 0.obs;

  /// cái này là tạo chữ ký
  SignatureController signatureController = SignatureController(
    penColor: AppColors.basicBlack,
    exportBackgroundColor: AppColors.colorTransparent,
    penStrokeWidth: 1.5,
    exportPenColor: Colors.black87,
  );

  final formKey = GlobalKey<FormState>();
  TextEditingController textEditingName = TextEditingController();
  TextEditingController textEditingIssuingAuthority = TextEditingController();
  TextEditingController textEditingCCCD = TextEditingController();
  TextEditingController textEditingHomeTown = TextEditingController();
  TextEditingController textEditingPermanentAddress = TextEditingController();
  TextEditingController textEditingNumberPhone = TextEditingController();
  TextEditingController textEditingEmail = TextEditingController();

  RxString textDateOfBirth = "".obs;
  RxString textDateOfIssue = "".obs;
  RxString textDateOfExpiration = "".obs;
  RxString textSex = "".obs;

  List<FormInputInformationModel> listFormInput = [];

  late ConfirmInfoRepository confirmInfoRepository;

  final Rx<FocusNode> nameFocus = FocusNode().obs;

  final Rx<FocusNode> releasedByFocus = FocusNode().obs;

  final Rx<FocusNode> birthplaceFocus = FocusNode().obs;

  final Rx<FocusNode> permanentAddressFocus = FocusNode().obs;

  final Rx<FocusNode> phoneFocus = FocusNode().obs;

  final Rx<FocusNode> emailFocus = FocusNode().obs;

  final RxBool isDrawing = false.obs;

  RxBool isValidate = false.obs;

  @override
  void onInit() {
    insertFormInformation(this);
    confirmInfoRepository = ConfirmInfoRepository(this);
    initData(this);
    signatureController.addListener(() {
      _onSignatureChanged();
    });
    super.onInit();
  }

  // void cleanData() {
  //   appController.authProfileRequestModel = AuthProfileResponseModel();
  //   appController.infoORCRequest = OCRDataModel();
  //   hiveApp.put(AppKey.sessionId, null);
  // }

  void _onSignatureChanged() {
    if (signatureController.points.isNotEmpty) {
      isDrawing.value = true;
    } else if (signatureController.points.isEmpty) {
      isDrawing.value = false;
    }
  }

  void handlePageViewChanged(int page) {
    KeyBoard.hide();
    currentPageIndex.value = page;
  }

  void funcLeadingBack() {
    currentPageIndex.value--;
    if (currentPageIndex.value >= 0) {
      pageViewController.animateToPage(currentPageIndex.value,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    } else {
      Get.back();
    }
  }

  void changDatePicker(int type) {
    ShowDialog.showDialogTimePicker(
        initDate: _getInitDate(type),
        onSubmit: (value) async {
          if (value is DateTime) {
            if (type == AppConst.typeDateOfBirth) {
              textDateOfBirth.value = convertDateToString(value, pattern1);
            } else if (type == AppConst.typeDateIssue) {
              textDateOfIssue.value = convertDateToString(value, pattern1);
            } else {
              textDateOfExpiration.value = convertDateToString(value, pattern1);
            }
            Get.back();
          }
        });
  }

  DateTime? _getInitDate(int type) {
    if (type == AppConst.typeDateOfBirth) {
      return convertStringToDate(textDateOfBirth.value, pattern1);
    } else if (type == AppConst.typeDateIssue) {
      return convertStringToDate(textDateOfIssue.value, pattern1);
    } else {
      return convertStringToDate(textDateOfExpiration.value, pattern1);
    }
  }

  Future<Uint8List> getSignature() async {
    Uint8List dataImg = await signatureController.toPngBytes() ?? Uint8List(0);
    img.Image image = img.decodeImage(dataImg)!;
    img.Image resized = img.copyResize(image, width: 200, height: 100);
    Uint8List resizedData = Uint8List.fromList(img.encodePng(resized));
    return resizedData;
  }

  Future<void> confirmInfo() async {
    Uint8List byteSign = await getSignature();
    try {
      showLoading();
      BaseResponseBE baseResponseBE =
          await confirmInfoRepository.fileSignatureRepository(byteSign);
      if (baseResponseBE.success == EnumStatusResponse.success) {
        appController.clearData();
        Get.offAllNamed(AppRoutes.routeHome);
        showDialog();
      } else {
        showSnackBar(baseResponseBE.message);
      }
    } catch (e) {
      showSnackBar(LocaleKeys.errorApi_errorException.tr);
    }
  }

  void showDialog() {
    String contentDialog = LocaleKeys.registerCa_registerFinal.tr;
    // if (appController.configCertificateModel.isCreateCertificate) {
    //   // contentDialog = LocaleKeys.registerCa_registerFinal.tr;
    // } else {
    //   // contentDialog = LocaleKeys.registerCa_verifyProfileFinal.tr;
    //   // Chuyển về true mặc định là tạo mới cts
    //   appController.configCertificateModel.isCreateCertificate = false;
    // }

    if (!appController.configCertificateModel.isCreateCertificate) {
      appController.configCertificateModel.isCreateCertificate = false;
    }

    ShowDialog.showDialogNotification(
      contentDialog,
      confirm: () {
        Get.back();
      },
      titleButton: LocaleKeys.dialog_close.tr,
      actionTitle: LocaleKeys.dialog_notify.tr,
    );
  }

  Future<void> updateORCData() async {
    KeyBoard.hide();
    if ((formKey.currentState?.validate() ?? false)) {
      if (textDateOfBirth.value.isEmpty ||
          textDateOfExpiration.value.isEmpty ||
          textDateOfIssue.value.isEmpty) {
        isValidate.value = true;
      } else {
        final personInfoRequestModel = PersonInfoRequestModel(
          sessionId: hiveApp.get(AppKey.sessionId),
          number: textEditingCCCD.text,
          name: textEditingName.text.trim(),
          dob: textDateOfBirth.value,
          sex: textSex.value,
          issueDate: textDateOfIssue.value,
          doe: textDateOfExpiration.value,
          issueOrg: textEditingIssuingAuthority.text.trim(),
          por: textEditingPermanentAddress.text.trim(),
          poo: textEditingHomeTown.text.trim(),
          phoneNumber: textEditingNumberPhone.text.trim(),
          email: textEditingEmail.text.trim(),
        );
        try {
          showLoading();
          final baseResponseBE = await confirmInfoRepository
              .updatePersonInfo(personInfoRequestModel);
          if (baseResponseBE.success == EnumStatusResponse.success) {
            pageViewController.animateToPage(
              currentPageIndex.value + 1,
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          } else {
            showSnackBar(baseResponseBE.message);
          }
        } catch (e) {
          showSnackBar(LocaleKeys.errorApi_errorException.tr);
        } finally {
          hideLoading();
        }
      }
    }
  }

  String nameServicePackage(PackageInfoResponse packageInfoResponse) {
    String typePackage =
        ServiceTypeEnum.mapServiceType[packageInfoResponse.certType] ?? "";

    return "${PackageTitleEnum.mapTitle[packageInfoResponse.tokenType]} $typePackage ";
  }
}
