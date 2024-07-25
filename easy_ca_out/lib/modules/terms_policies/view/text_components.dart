import 'package:flutter/widgets.dart';

import '../../../core/core.src.dart';
import '../../../shares/shares.src.dart';

Widget buildTextBlock({
  required String text,
  int maxline = 10,
  StyleEnum? style,
}) {
  return TextUtils(
    text: text,
    size: style != null ? null : AppDimens.sizeTextSmall,
    maxLine: maxline,
    availableStyle: style,
  );
}
