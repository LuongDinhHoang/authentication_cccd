import 'package:dio/dio.dart';

class LiveNessRequestModel {
  LiveNessRequestModel({
    required this.fileData,
    required this.sessionId,
    required this.orderSequence,
    required this.faceDirection,
    required this.smileProbability,
  });

  final String fileData;
  final String? sessionId;
  final String? orderSequence;
  final String? faceDirection;
  final String? smileProbability;

  factory LiveNessRequestModel.fromJson(Map<String, dynamic> json){
    return LiveNessRequestModel(
      fileData: json["fileData"],
      sessionId: json["sessionId"],
      orderSequence: json["orderSequence"],
      faceDirection: json["faceDirection"],
      smileProbability: json["smileProbability"],
    );
  }

  Future<Map<String, dynamic>> toJson() async => {
    "fileData": await MultipartFile.fromFile(
      fileData,
    ),
    "sessionId": sessionId,
    "orderSequence": orderSequence,
    "faceDirection": faceDirection,
    "smileProbability": smileProbability,
  };

}
