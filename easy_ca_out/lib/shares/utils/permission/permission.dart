import 'package:permission_handler/permission_handler.dart';

Future<PermissionStatus> checkPermission(
    List<Permission> listPermission) async {
  PermissionStatus status = PermissionStatus.granted;
  Map<Permission, PermissionStatus> statuses = await listPermission.request();
  for (var value in statuses.values) {
    if (value == PermissionStatus.permanentlyDenied) {
      status = PermissionStatus.permanentlyDenied;
      break;
    }
    if (value == PermissionStatus.denied) {
      status = PermissionStatus.denied;
      break;
    }
    // if (value == PermissionStatus.undetermined) {
    //   status = PermissionStatus.undetermined;
    //   break;
    // }
  }
  return status;
}
//
// DateTime? _currentBackPressTime;
// Future<bool> onWillPop() {
//   DateTime now = DateTime.now();
//   if (_currentBackPressTime == null ||
//       now.difference(_currentBackPressTime ?? DateTime.now()) >
//           const Duration(seconds: 2)) {
//     _currentBackPressTime = now;
//     Fluttertoast.showToast(msg: AppStr.exitApp.tr);
//     return Future.value(false);
//   }
//   return Future.value(true);
// }
//
// Future<void> openUrlString(String url) async {
//   if (await canLaunchUrlString(url)) {
//     await launchUrlString(url);
//   }
// }
