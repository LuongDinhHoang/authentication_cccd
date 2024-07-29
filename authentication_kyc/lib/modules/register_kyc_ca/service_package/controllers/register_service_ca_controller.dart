import 'package:two_id_c06verify/base_app/base_app.src.dart';
import 'package:two_id_c06verify/core/core.src.dart';
import 'package:two_id_c06verify/shares/shares.src.dart';

class RegisterServiceCaController extends BaseGetxController {
  /// Chuyển sang màn tạo tài khoản
  final isCreateAcc = true;

  String statusNFC = "";

  @override
  Future<void> onInit() async {
    // statusNFC = await CheckSupportNfc.checkNfcAvailability();
    // WidgetsBinding.instance.addObserver(this);
    super.onInit();
  }

  @override
  void onClose() {
    // WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  // void showNfcBottomSheet(bool isDisableNfc) {
  //   Get.bottomSheet(
  //     SDSBottomSheet(
  //       title: "",
  //       body: BottomSheetCheckNfc(isDisableNfc),
  //       noHeader: true,
  //     ),
  //     isScrollControlled: true,
  //   );
  // }

  Future<void> handleAvailability() async {
    // final isNfcDisabled = statusNFC == AppConst.nfcDisabled;
    // if (statusNFC.isNotEmpty && statusNFC != AppConst.nfcAvailable) {
    //   showNfcBottomSheet(isNfcDisabled);
    // } else if (statusNFC.isEmpty) {
    //   showNfcBottomSheet(false);
    // } else {
    //   // Get.toNamed(AppRoutes.routeVerifyProfile);
    //   Get.toNamed(AppRoutes.routeAuthenticationGuide);
    // }

    Get.toNamed(AppRoutes.routeVerifyProfile);
  }

// @override
// Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
//   if (state == AppLifecycleState.resumed) {
//     statusNFC = await CheckSupportNfc.checkNfcAvailability();
//     if (Get.currentRoute == AppRoutes.routeRegisterCA) {
//       if (statusNFC == AppConst.nfcAvailable) {
//         if (Get.isBottomSheetOpen ?? false) {
//           Get.back();
//           showSnackBar(LocaleKeys.check_nfc_nfc_open.tr);
//         }
//       }
//     }
//   }
// }
}
