import 'dart:convert';
import 'dart:typed_data';

import '../../../../../shares/shares.src.dart';

class FilesImageModel {
  FilesImageModel({
    required this.fileData,
    this.fileType,
    this.fileId,
  });

  Rx<Uint8List?> fileData;
  String? fileType;
  int? fileId;

  factory FilesImageModel.fromJson(Map<String, dynamic> json) {
    return FilesImageModel(
      fileData: json["fileData"],
      fileType: json["fileType"],
      fileId: json["fileId"],
    );
  }

  Map<String, String> toJson() => {
        "fileType": fileType??"",
        "fileData":
            fileData.value != null ? base64Encode(fileData.value!) : "",
        // "fileId": fileId,
      };
}
