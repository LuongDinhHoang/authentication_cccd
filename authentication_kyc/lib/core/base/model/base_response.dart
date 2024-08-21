import 'package:two_id_c06verify/core/base/base.src.dart';

class BaseResponseBE<T> {
  BaseResponseBE({
    required this.status,
    required this.timestamp,
    required this.data,
    required this.transId,
    this.errors,
  });

  final bool status;
  final String timestamp;
  final String transId;
  final T? data;
  final List<ErrorModelResponse>? errors;

  factory BaseResponseBE.fromJson(
    Map<String, dynamic> json, {
    Function(Map<String, dynamic> x)? func,
  }) {
    T? convertObject() => func != null ? func(json["data"]) : json["data"];
    return BaseResponseBE<T>(
      status: json["status"] ?? false,
      timestamp: json["timestamp"] ?? "",
      data: json["data"] != null ? convertObject() : null,
      transId: json["transId"] ?? "",
      errors: json["errors"] == null
          ? []
          : List<ErrorModelResponse>.from(
              json["errors"]!.map((x) => ErrorModelResponse.fromJson(x))),
    );
  }
}
