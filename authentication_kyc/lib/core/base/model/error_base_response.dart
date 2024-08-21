class ErrorModelResponse {
  ErrorModelResponse({
    required this.code,
    required this.message,
  });

  final String? code;
  final Message? message;

  factory ErrorModelResponse.fromJson(Map<String, dynamic> json){
    return ErrorModelResponse(
      code: json["code"],
      message: json["message"] == null ? null : Message.fromJson(json["message"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message?.toJson(),
  };

}

class Message {
  Message({
    required this.vn,
    required this.en,
  });

  final String? vn;
  final String? en;

  factory Message.fromJson(Map<String, dynamic> json){
    return Message(
      vn: json["vn"],
      en: json["en"],
    );
  }

  Map<String, dynamic> toJson() => {
    "vn": vn,
    "en": en,
  };

}
