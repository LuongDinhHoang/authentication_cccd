class BaseResponseListBE<T> {
  BaseResponseListBE({
    required this.message,
    required this.success,
    required this.data,
  });

  final String message;
  final int success;

  final List<T> data;

  factory BaseResponseListBE.fromJson(
      Map<String, dynamic> json,
        Function(dynamic x) func,
      ) {
    return BaseResponseListBE<T>(
      message: json["msg"] ?? '',
      success: json["status"] ?? -1,
      data: json["data"] != null
          ? List<T>.from(json["data"].map((x) => func(x)))
          : [],
    );
  }
}
