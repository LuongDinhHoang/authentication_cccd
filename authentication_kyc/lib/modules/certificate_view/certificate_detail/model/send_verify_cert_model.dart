class SendVerifyCertModel {
    SendVerifyCertModel({
        required this.sessionId,
        required this.verifyCertStatus,
        required this.acceptTime,
        required this.device,
        required this.ip,
    });

    final String sessionId;
    final int verifyCertStatus;
    final DateTime? acceptTime;
    final String device;
    final String ip;

    factory SendVerifyCertModel.fromJson(Map<String, dynamic> json){ 
        return SendVerifyCertModel(
            sessionId: json["sessionId"] ?? "",
            verifyCertStatus: json["verifyCertStatus"] ?? 0,
            acceptTime: DateTime.tryParse(json["acceptTime"] ?? ""),
            device: json["device"] ?? "",
            ip: json["ip"] ?? "",
        );
    }

    Map<String, dynamic> toJson() => {
        "sessionId": sessionId,
        "verifyCertStatus": verifyCertStatus,
        "acceptTime": acceptTime?.toIso8601String(),
        "device": device,
        "ip": ip,
    };

}
