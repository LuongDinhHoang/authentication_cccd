class LoginCaResponseModel {
  LoginCaResponseModel({
    required this.token,
    required this.userId,
  });

  final String token;
  final int userId;

  factory LoginCaResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginCaResponseModel(
      token: json["token"] ?? "",
      userId: json["userId"] ?? 0,
    );
  }
}
