import 'package:easy_ca/shares/shares.src.dart';

/// Thực hiện lưu trữ dữ liệu bảo mật
class SecureStorage {
  static const FlutterSecureStorage storage = FlutterSecureStorage();

  static Future saveData({
    required String key,
    required String value,
  }) async {
    return await storage.write(
      key: key,
      value: value,
    );
  }

  static Future readData({required String key}) async {
    return await storage.read(
      key: key,
    );
  }

  static Future deleteData({required String key}) async {
    return await storage.delete(
      key: key,
    );
  }
}
