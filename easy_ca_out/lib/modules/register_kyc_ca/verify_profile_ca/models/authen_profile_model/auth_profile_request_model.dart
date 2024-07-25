class AuthProfileRequestModel {
  AuthProfileRequestModel({
    this.sessionId,
    this.policyStatus,
    this.acceptTime,
    this.device,
    this.ip,
  });

  final String? sessionId;
  final String? policyStatus;
  final String? acceptTime;
  final String? device;
  final String? ip;

  factory AuthProfileRequestModel.fromJson(Map<String, dynamic> json) {
    return AuthProfileRequestModel(
      sessionId: json["sessionId"] ?? "",
      policyStatus: json["policyStatus"] ?? "",
      acceptTime: json["acceptTime"] ?? "",
      device: json["device"] ?? "",
      ip: json["ip"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "sessionId": sessionId,
      "policyStatus": policyStatus,
      "acceptTime": acceptTime,
      "device": device,
      "ip": ip,
    };
  }
}
