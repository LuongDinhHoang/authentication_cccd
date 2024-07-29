import 'package:two_id_c06verify/assets.dart';
import 'package:two_id_c06verify/generated/locales.g.dart';
import 'package:get/get_utils/get_utils.dart';

class LiveNessCollection {
  static List<String> questions = [
    LocaleKeys.live_ness_actionFaceLeft.tr,
    LocaleKeys.live_ness_actionFaceRight.tr,
    LocaleKeys.live_ness_actionFaceBetween.tr,
    LocaleKeys.live_ness_actionFaceUp.tr,
    LocaleKeys.live_ness_actionFaceSmile.tr,
    LocaleKeys.live_ness_actionFaceBlink.tr,
  ];

  static List<String> types = [
    LocaleKeys.live_ness_faceYaw.tr,
    LocaleKeys.live_ness_faceYaw.tr,
    LocaleKeys.live_ness_facePith.tr,
    LocaleKeys.live_ness_facePith.tr,
    LocaleKeys.live_ness_faceSmile.tr,
    LocaleKeys.live_ness_faceOpen.tr
  ];

  static List<String> listFaceDetach = [
    Assets.ASSETS_SVG_ICON_FACE_LEFT_SVG,
    Assets.ASSETS_SVG_ICON_FACE_RIGHT_SVG,
    Assets.ASSETS_SVG_ICON_FACE_BETWEEN_SVG,
    Assets.ASSETS_SVG_ICON_FACE_UP_SVG,
    Assets.ASSETS_SVG_ICON_FACE_SMILE_SVG,
    Assets.ASSETS_SVG_ICON_FACE_BLINK_SVG,
  ];

  static Map<String, String> listMapOderAction = {
    LocaleKeys.live_ness_actionFaceLeft.tr: "TRAI",
    LocaleKeys.live_ness_actionFaceRight.tr: "PHAI",
    LocaleKeys.live_ness_actionFaceUp.tr: "TREN",
    LocaleKeys.live_ness_actionFaceSmile.tr: "CUOI",
    LocaleKeys.live_ness_actionFaceBetween.tr: "GIUA",
    LocaleKeys.live_ness_actionFaceBlink.tr: "NHAY",
  };

  static Map<String, String> listMapOderActionSuccess = {
    LocaleKeys.live_ness_actionFaceLeft.tr: "LEFT",
    LocaleKeys.live_ness_actionFaceRight.tr: "RIGHT",
    LocaleKeys.live_ness_actionFaceUp.tr: "ABOVE",
    LocaleKeys.live_ness_actionFaceSmile.tr: "SMILE",
    LocaleKeys.live_ness_actionFaceBetween.tr: "BETWEEN",
    LocaleKeys.live_ness_actionFaceBlink.tr: "BLINK",
  };
}
