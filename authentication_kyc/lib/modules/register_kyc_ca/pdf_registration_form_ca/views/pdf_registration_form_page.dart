import 'package:authentication_kyc/modules/register_kyc_ca/pdf_registration_form_ca/controllers/pdf_registration_form_controller.dart';
import 'package:authentication_kyc/shares/shares.src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:authentication_kyc/assets.dart';
import 'package:authentication_kyc/base_app/base_app.src.dart';
import 'package:authentication_kyc/core/core.src.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfRegistrationFormPage extends BaseGetWidget {
  const PdfRegistrationFormPage({Key? key}) : super(key: key);

  @override
  PdfRegistrationFormController get controller =>
      Get.put(PdfRegistrationFormController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      body: baseShowLoading(
        () => SafeArea(
          child: Stack(
            children: [
              _buildPfd(),
              _buildPageNumberContainer(),
              _buildCloseIconContainer(),
            ],
          ),
        ),
      ),
    );
  }

  // Builds pfd
  Widget _buildPfd() {
    return Container(
      width: Get.width,
      height: Get.height / 1.4,
      color: AppColors.basicWhite,
      child: controller.isLoadPdfFalse.value
          ? InkWell(
              onTap: () async {
                await controller.getPdfData();
              },
              child: Center(
                child: SvgPicture.asset(
                  Assets.ASSETS_SVG_ICON_LOAD_ERR_SVG,
                ),
              ),
            )
          : SfPdfViewerTheme(
              data: SfPdfViewerThemeData(
                backgroundColor: AppColors.basicWhite,
              ),
              child: SfPdfViewer.memory(
                controller.pdfData.value,
                controller: controller.pdfViewerController,
                onDocumentLoadFailed: (v) {
                  controller.isLoadPdfFalse.value = true;
                },
                onDocumentLoaded: (details) {
                  controller.totalPage.value =
                      controller.pdfViewerController.pageCount;
                  controller.indexPage.value =
                      controller.pdfViewerController.pageNumber;
                },
                onPageChanged: (PdfPageChangedDetails details) {
                  controller.indexPage.value = details.newPageNumber;
                },
              ),
            ),
    ).paddingAll(AppDimens.padding10);
  }

  // Builds the container that displays the page number
  Widget _buildPageNumberContainer() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.padding22),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.basicGrey40,
            borderRadius: BorderRadius.circular(AppDimens.radius20),
          ),
          child: TextUtils(
            text: "${controller.indexPage.value}/${controller.totalPage.value}",
            availableStyle: StyleEnum.bodyBold,
          ).paddingSymmetric(
            horizontal: AppDimens.padding12,
            vertical: AppDimens.padding5,
          ),
        ),
      ),
    );
  }

  // Builds the container that contains the close icon
  Widget _buildCloseIconContainer() {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.padding22),
        child: InkWell(
          onTap: () {
            Get.back();
          },
          child: SvgPicture.asset(
            Assets.ASSETS_SVG_ICON_CLOSE_SVG,
          ),
        ),
      ),
    );
  }
}
