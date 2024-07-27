import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LengthLimitingTextFieldFormatterFixed
    extends LengthLimitingTextInputFormatter {
  final int? lengthLimit;
  LengthLimitingTextFieldFormatterFixed(this.lengthLimit) : super(lengthLimit);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (lengthLimit == null ||
        lengthLimit == -1 ||
        newValue.text.characters.length <= lengthLimit!) {
      return newValue;
    }
    if (lengthLimit! > 0 && newValue.text.characters.length > lengthLimit!) {
      // If already at the maximum and tried to enter even more, keep the old
      // value.
      if (oldValue.text.characters.length == lengthLimit) {
        return oldValue;
      }

      // ignore: invalid_use_of_visible_for_testing_member
      return LengthLimitingTextInputFormatter.truncate(newValue, lengthLimit!);
    }
    return newValue;
  }
}
