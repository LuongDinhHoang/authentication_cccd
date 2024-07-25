import 'package:dio/dio.dart';
import 'package:easy_ca/base_app/controllers_base/base_controller.src.dart';
import 'package:easy_ca/base_app/repository_base/repository_base.src.dart';
import 'package:get/get.dart';

class BaseRepository {
  final BaseApi _baseApi = Get.find<BaseApi>();
  final BaseGetxController controller;

  BaseRepository(this.controller);

  /// [isQueryParametersPost]: `true`: phương thức post gửi params, mặc định = `false`
  ///
  /// [dioOptions]: option của Dio() sử dụng khi gọi api có option riêng
  ///
  /// [functionError]: chạy function riêng khi request xảy ra Exception (mặc định sử dụng [showDialogError])
  Future<dynamic> baseCallApi(
    String action,
    String requestMethod, {
    dynamic jsonMap,
    bool isDownload = false,
    String? urlOther,
    Map<String, String>? headersUrlOther,
    bool isQueryParametersPost = false,
    BaseOptions? dioOptions,
    bool isHaveVersion = true,
    bool isToken = true,
    Function(Object error)? functionError,
    Duration? timeOut,
  }) {
    return _baseApi.callApi(
      action,
      requestMethod,
      jsonMap: jsonMap,
      isDownload: isDownload,
      urlOther: urlOther,
      headersUrlOther: headersUrlOther,
      isQueryParametersPost: isQueryParametersPost,
      controller: controller,
      dioOptions: dioOptions,
      functionError: functionError,
      isHaveVersion: isHaveVersion,
      isToken: isToken,
      timeOut: timeOut,
    );
  }
}
