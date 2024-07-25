class BaseResponseBE<T> {
  BaseResponseBE({
    required this.message,
    required this.success,
    required this.data,
  });

  final String message;
  final int success;

  final T? data;

  factory BaseResponseBE.fromJson(
      Map<String, dynamic> json, {
        Function(Map<String, dynamic> x)? func,
      }) {
    T? convertObject() => func != null ? func(json["data"]) : json["data"];
    return BaseResponseBE<T>(
      message: json["msg"] ?? '',
      success: json["status"] ?? -1,
      data: json["data"] != null ? convertObject() : null,
    );
  }
}
