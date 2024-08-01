import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:two_id_c06verify/generated/locales.g.dart';

bool isPasswordValidate({
  required String password,
  required int minLength,
  int maxLength = 0,
}) {
  if (password.isStringNotEmpty) {
    // Trường hợp có yêu cầu nhập tối đa vào mật khẩu.
    if (maxLength > 0) {
      if (password.length >= minLength && password.length <= maxLength) {
        return true;
      }
    } else {
      // Trường hợp chỉ yêu cầu số ký tự tối thiểu nhập vào của mật khẩu.
      if (password.length >= minLength) {
        return true;
      }
    }
  }
  return false;
}

extension StringUtils on String? {
  bool get isStringNotEmpty => this != null && this!.trim().isNotEmpty;

  bool get isNullOrEmpty => this == null || (this?.trim().isEmpty ?? true);
}

bool isListNotEmpty(List<dynamic>? list) => list != null && list.isNotEmpty;

bool isPhoneValidate({required String? value}) {
  if (value == null) return false;
  if (value.trim().isEmpty || !RegExp(r'\d{10,14}').hasMatch(value)) {
    return false;
  }
  // if (int.parse(value) == 0) {
  //   return false;
  // }

  return true;
}

bool isIdentityCard({required String? value}) {
  if (value == null) return false;
  if (value.trim().isEmpty || !RegExp(r'\d{9,12}').hasMatch(value)) {
    return false;
  }
  return true;
}

bool isTaxCode({required String? taxCode}) {
  if (taxCode!.length < 10) return false;
  return true;
}

bool isEmail(String? value) {
  RegExp email = RegExp(
      r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");

  if (value == null) return false;
  if (value.trim().isEmpty || !email.hasMatch(value.toLowerCase())) {
    return false;
  }

  return true;
}

String convertDoubleToStringSmart(double? value) {
  return '${value?.toInt() == value ? value?.toInt() : value}';
}

bool isIpAddress(String? value) {
  final RegExp ipRegex = RegExp(
      r"^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$");

  if (value == null) return false;
  if (value.trim().isEmpty || !ipRegex.hasMatch(value.toLowerCase())) {
    return false;
  }

  return true;
}

String? validatePass(String? text) {
  if (text == null || text.isEmpty) {
    return LocaleKeys.login_passwordEmpty.tr;
  }
  // if (text.length < 6) return AppStr.errorRegisterReInputPassword.tr;
  return null;
}

String? validateRepass(String? text, String pass) {
  if (text == null || text.isEmpty) {
    return LocaleKeys.login_passwordEmpty.tr;
  } else if (text != pass) {
    return LocaleKeys.ChangePassword_passwordDifferent.tr;
  }

  return null;
}
//
// String? isPasswordValid(String? value) {
//   if (value == null || value.length <= 0) {
//     return AppStr.passwordIsNull.tr;
//   }
//
//   if (value.length < 8) return AppStr.notePassword.tr;
// // Kiểm tra chữ hoa
//   bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
//   if (!hasUppercase) {
//     return AppStr.notePassword.tr;
//   }
//
// // Kiểm tra số
//   bool hasDigit = value.contains(RegExp(r'[0-9]'));
//   if (!hasDigit) {
//     return AppStr.notePassword.tr;
//   }
//
//   return null;
// }
//
// String? validatePhoneNumber(String? text) {
//   if (text == null || text.isEmpty) {
//     return AppStr.errorRegisterInputPhoneIsNull.tr;
//   }
//
//   if (text.length != 10) return AppStr.errorRegisterInputPhone.tr;
//   return null;
// }
//
// String? validateName(String? text) {
//   if (text == null || text.length <= 0) {
//     return AppStr.errorRegisterInputName.tr;
//   }
//   return null;
// }
//
// String? validateId(String? text) {
//   if (text == null || text.length <= 0) {
//     return AppStr.errorRegisterInputId.tr;
//   } else if (text.length < 7 || text.length > 12) {
//     return AppStr.errorIdentificationLength.tr;
//   }
//   return null;
// }
