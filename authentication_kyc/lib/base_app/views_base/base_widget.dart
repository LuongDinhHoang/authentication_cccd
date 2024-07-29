import 'package:two_id_c06verify/base_app/controllers_base/base_controller.src.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';

import '../../shares/widgets/widgets.src.dart';

abstract class BaseGetWidget<T extends BaseGetxController> extends GetView<T> {
  const BaseGetWidget({Key? key}) : super(key: key);

  Widget buildWidgets(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return buildWidgets(context);
  }

  Widget baseShowLoading(WidgetCallback child, {Color? colorIcon}) {
    return Obx(
      () => controller.isShowLoading.value
          ? Center(child: UtilWidget.buildLoading(colorIcon))
          : child(),
    );
  }

  Widget buildLoadingOverlay(WidgetCallback child, {Color? colorIcon}) {
    return Obx(
      () => LoadingOverlayPro(
        progressIndicator: UtilWidget.buildLoading(colorIcon),
        isLoading: controller.isLoadingOverlay.value,
        child: child(),
      ),
    );
  }

  Widget baseShowLoadingCustom(WidgetCallback child, {Color? colorIcon}) {
    return Obx(
          () => controller.isLoadingOverlay.value
          ? Center(child: UtilWidget.buildLoading(colorIcon))
          : child(),
    );
  }

// Widget baseShimmerLoading(WidgetCallback child, {Widget? shimmer}) {
//   return Obx(
//     () => controller.isShowLoading.value
//         ? shimmer ?? UtilWidget.buildShimmerLoading()
//         : child(),
//   );
// }

// Widget buildLoadingOverlay(WidgetCallback child, {Color? colorIcon}) {
//   return Obx(
//     () => Stack(
//       children: [
//         LoadingOverlayPro(
//           progressIndicator: UtilWidget.buildLoading(colorIcon: colorIcon),
//           isLoading: controller.isLoadingOverlay.value,
//           child: child(),
//         ),
//       ],
//     ),
//   );
// }

// static Widget listEmpty() {
//   return const Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       FaIcon(
//         FontAwesomeIcons.circleExclamation,
//         size: 30,
//         color: DefaultTheme.greyText,
//       ),
//       Text(
//         AppStr.emptyList,
//         style: TextStyle(
//           fontSize: 20,
//           color: DefaultTheme.greyText,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     ],
//   );
// }
}
