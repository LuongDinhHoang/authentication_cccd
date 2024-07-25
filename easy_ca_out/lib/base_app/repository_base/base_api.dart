import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:easy_ca/base_app/controllers_base/base_controller.src.dart';
import 'package:easy_ca/core/core.src.dart';

class BaseApi {
  static Dio dio = getBaseDio();

  static Dio getBaseDio() {
    Dio dio = Dio();

    dio.options = buildDefaultOptions();
/*
    if (Diolog().showDebug) {
      dio.interceptors.add(SDSDioLogInterceptor());
    }*/
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      },
    );

/*    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };*/
    return dio;
  }

  static BaseOptions buildDefaultOptions({Duration? timeOut}) {
    return BaseOptions()
      ..connectTimeout =
          timeOut ?? const Duration(milliseconds: AppConst.requestTimeOut)
      ..receiveTimeout =
          timeOut ?? const Duration(milliseconds: AppConst.requestTimeOut);
  }

  static void close() {
    dio.close(force: true);
    updateCurrentDio();
  }

  static void updateCurrentDio() {
    dio = getBaseDio();
  }

  static Dio getCurrentDio() {
    return dio;
  }

  void setOnErrorListener(Function(Object error) onErrorCallBack) {
    this.onErrorCallBack = onErrorCallBack;
  }

  late Function(Object error) onErrorCallBack;

  /// [isQueryParametersPost]: `true`: phương thức post gửi params, mặc định = `false`
  ///
  /// [dioOptions]: option của Dio() sử dụng khi gọi api có option riêng
  ///
  /// [functionError]: chạy function riêng khi request xảy ra Exception (mặc định sử dụng [showDialogError])
  Future<dynamic> callApi(
    String action,
    String requestMethod, {
    dynamic jsonMap,
    bool isDownload = false,
    String? urlOther,
    Map<String, String>? headersUrlOther,
    bool isQueryParametersPost = false,
    required BaseGetxController controller,
    BaseOptions? dioOptions,
    Function(Object error)? functionError,
    bool isToken = true,
    bool isHaveVersion = true,
    Duration? timeOut,
  }) async {
    dio.options = dioOptions ?? buildDefaultOptions(timeOut: timeOut);
    dynamic response;
    String url = urlOther ??
        (AppApi.url + action + (isHaveVersion ? AppApi.version : ""));
    Map<String, String> headers = isToken
        ? (headersUrlOther ?? getBaseHeader())
        : {"Content-Type": "application/json"};
    Options options = isDownload
        ? Options(
            headers: headers,
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status != null && status < 500;
            })
        : Options(
            headers: headers,
            //method: requestMethod.toString(),
            responseType: ResponseType.json,
          );
    CancelToken cancelToken = CancelToken();
    controller.addCancelToken(cancelToken);
    try {
      if (requestMethod == EnumRequestMethod.post) {
        if (isQueryParametersPost) {
          response = await dio.post(
            url,
            queryParameters: jsonMap,
            options: options,
            cancelToken: cancelToken,
          );
        } else {
          response = await dio.post(
            url,
            data: jsonMap,
            options: options,
            cancelToken: cancelToken,
          );
        }
      } else if (requestMethod == EnumRequestMethod.delete) {
        response = await dio.delete(
          url,
          data: jsonMap,
          options: options,
          cancelToken: cancelToken,
        );
      } else if (requestMethod == EnumRequestMethod.put) {
        response = await dio.put(
          url,
          data: jsonMap,
          options: options,
          cancelToken: cancelToken,
        );
      } else {
        response = await dio.get(
          url,
          queryParameters: jsonMap,
          options: options,
          cancelToken: cancelToken,
        );
      }
      return response.data;
    } catch (e) {
      controller.cancelRequest(cancelToken);
      return functionError != null ? functionError(e) : showDialogError(e);
    }
  }

  dynamic showDialogError(dynamic e) {
    if (e.response?.data != null &&
        e.response.data is Map &&
        e.response.data["errorMessage"] != null) return e.response.data;
    onErrorCallBack(e);
  }

  Map<String, String> getBaseHeader() {
    return {
      "Content-Type": "application/json",
      'Authorization': hiveApp.get(AppKey.keyToken) ?? "",
    };
  }
}
