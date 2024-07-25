import 'package:easy_ca/base_app/base_app.src.dart';

/// Lấy tên thiết bị điện thoại
String getNameDevice() {
  String nameDevice = "";
  if (iosDeviceInfo != null) {
    nameDevice = iosDeviceInfo!.utsname.machine;
  } else {
    nameDevice = androidDeviceInfo!.model;
  }
  return nameDevice;
}

/// Lấy id điện thoại
String getIdDevice() {
  String idDevice = "";
  if (iosDeviceInfo != null) {
    idDevice = iosDeviceInfo!.identifierForVendor.toString();
  } else {
    idDevice = androidDeviceInfo!.id;
  }
  return idDevice;
}
