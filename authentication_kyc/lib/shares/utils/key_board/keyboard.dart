import 'package:get/get.dart';

class KeyBoard {
  static void hide() {
    //   FocusManager.instance.primaryFocus?.unfocus();
    Get.focusScope!.unfocus();
  }

  static bool keyboardIsVisible() {
    return Get.mediaQuery.viewInsets.bottom != 0.0;
  }
}
