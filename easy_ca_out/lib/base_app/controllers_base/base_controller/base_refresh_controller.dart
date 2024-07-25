import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'base_controller.dart';

abstract class BaseRefreshGetxController extends BaseGetxController {
  ScrollController scrollControllerUpToTop = ScrollController();
  RxBool showBackToTopButton = false.obs;

  /// Controller của smart refresh.
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  /// Hàm load more.
  Future<void> onLoadMore();

  /// Hàm refresh page.
  Future<void> onRefresh();

  @override
  void onInit() {
    scrollControllerUpToTop.addListener(() {
      showBackToTopButton.value = scrollControllerUpToTop.offset >= 100;
    });
    super.onInit();
  }
}
