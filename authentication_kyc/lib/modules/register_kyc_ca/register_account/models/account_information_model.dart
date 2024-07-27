class AccountInformationModel {
  String idCard;

  String numberPhone;

  String email;

  AccountInformationModel({
    required this.email,
    required this.idCard,
    required this.numberPhone,
  });

  Map<String, dynamic> toJson() {
    return {
      'cccd': idCard,
      'phone': numberPhone,
      'email': email,
    };
  }

}
