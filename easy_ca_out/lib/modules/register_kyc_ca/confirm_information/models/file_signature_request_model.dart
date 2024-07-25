import 'dart:convert';
import 'dart:typed_data';

class FileSignatureRequestModel {
  FileSignatureRequestModel({
    required this.sessionId,
    required this.file,
  });

  final String sessionId;
  final Uint8List file;

  factory FileSignatureRequestModel.fromJson(Map<String, dynamic> json){
    return FileSignatureRequestModel(
      sessionId: json["sessionId"] ?? "",
      file: json["signBase64"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sessionId': sessionId,
      // Chuyển Uint8List thành chuỗi base64 trước khi lưu vào JSON
      'signBase64': base64Encode(file),
    };
  }

}
