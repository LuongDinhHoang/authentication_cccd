import 'dart:convert';
import 'dart:typed_data';

import 'package:easy_ca/base_app/base_app.src.dart';
import 'package:easy_ca/core/base/base.src.dart';
import 'package:easy_ca/core/core.src.dart';
import 'package:easy_ca/modules/register_kyc_ca/pdf_registration_form_ca/repository/pdf_registration_form_repository.dart';
import 'package:easy_ca/shares/package/export_package.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfRegistrationFormController extends BaseGetxController {
  late PdfRegistrationFormRepository pdfRegistrationFormRepository;

  Rx<Uint8List> pdfData = Uint8List(0).obs;

  RxBool isLoadPdfFalse = false.obs;

  RxInt totalPage = 0.obs;

  RxInt indexPage = 0.obs;

  PdfViewerController pdfViewerController = PdfViewerController();

  @override
  Future<void> onInit() async {
    pdfRegistrationFormRepository = PdfRegistrationFormRepository(this);

    await getPdfData().whenComplete(() => hideLoading());
    super.onInit();
  }

  Future<void> getPdfData() async {
    try {
      showLoading();
      BaseResponseBE baseResponseBE =
          await pdfRegistrationFormRepository.getPdf();
      if (baseResponseBE.success == EnumStatusResponse.success) {
        String data = baseResponseBE.data.toString();
        pdfData.value = base64ToUint8List(data);
        isLoadPdfFalse.value = false;
      }
      hideLoading();
    } catch (e) {
      hideLoading();
      isLoadPdfFalse.value = true;
    }
  }

  Uint8List base64ToUint8List(String base64String) {
    return base64Decode(base64String);
  }
}
