class InputFormatterEnum {
  /// 0 : LengthLimitingText. Giới hạn ký tự nhập(nếu có)
  static const int lengthLimitingText = 0;

  /// 1 : digitsOnly. Chỉ nhập số
  static const int digitsOnly = 1;

  /// 2 : TaxCode. Kiểu nhập là mã số thuế
  static const int taxCode = 2;

  /// 3 : Không cho nhập các ký tự đặc biệt. dấu cách
  static const int textOnly = 3;

  /// 4 : Nhập giá trị tiền
  static const int currency = 4;

  /// 5 : Cho phép nhập giá trị âm
  static const int negativeNumber = 5;

  /// 6 : Cho phép nhập giá trị thập phân
  static const int decimalNumber = 6;

  /// 7 : Cho phép nhập giá trị căn cước
  static const int identity = 7;

  /// 8 : nhập form là số điện thoại
  static const int phoneNumber = 8;

  /// 9 : hiện nhập bàn phím email
  static const int email = 9;

  ///10: nhập ký tự đặc biệt không bao gồm dấu cách
  static const int password = 10;
}
