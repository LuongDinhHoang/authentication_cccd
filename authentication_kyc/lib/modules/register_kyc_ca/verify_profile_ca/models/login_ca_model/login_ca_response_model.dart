class LoginCaResponseModel {
  LoginCaResponseModel({
    required this.accessToken,
    required this.refreshToken,
  });

  final String? accessToken;
  final String? refreshToken;

  factory LoginCaResponseModel.fromJson(Map<String, dynamic> json){
    return LoginCaResponseModel(
      accessToken: json["accessToken"],
      refreshToken: json["refreshToken"],
    );
  }

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
    "refreshToken": refreshToken,
  };

}
