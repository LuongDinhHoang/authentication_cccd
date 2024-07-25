class AuthProfileResponseModel {
  AuthProfileResponseModel({
    this.sessionId,
    this.identity,
    this.name,
    this.registerTime,
    this.serviceType,
    this.serviceExpiry,
    this.phoneNumber,
    this.email,
    this.tokenType,
    this.registerType,
    this.serviceName,
  });

  final String? sessionId;
  String? identity;
  final String? name;
  final String? registerTime;
  final String? serviceType;
  final String? serviceExpiry;
  final String? phoneNumber;
  final String? email;
  final String? tokenType;
  final String? registerType;
  final String? serviceName;

  factory AuthProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthProfileResponseModel(
      sessionId: json["sessionId"] ?? "",
      identity: json["identity"] ?? "",
      name: json["name"] ?? "",
      registerTime: json["registerTime"] ?? "",
      serviceType: json["serviceType"] ?? "",
      serviceExpiry: json["serviceExpiry"] ?? "",
      phoneNumber: json["phone"] ?? "",
      email: json["email"] ?? "",
      tokenType: json["tokenType"] ?? "",
      registerType: json["registerType"] ?? "",
      serviceName: json["serviceName"] ?? "",
    );
  }
}
