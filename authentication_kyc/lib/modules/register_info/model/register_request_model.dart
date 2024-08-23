class RegisterRequestModel {
  RegisterRequestModel({
    this.username,
    this.email,
    this.password,
    this.fullName,
    this.citizenNumber,
    this.dateOfBirth,
    this.gender,
    this.nationality,
    this.nativeLand,
    this.ethnic,
    this.religion,
    this.address,
    this.issuePlate,
    this.issueDate,
    this.expiredDate,
    this.identification,
    this.phone,
    this.secretKey,
  });

  final String? username;
  final String? email;
  final String? password;
  final String? fullName;
  final String? citizenNumber;
  final String? dateOfBirth;
  final String? gender;
  final String? nationality;
  final String? nativeLand;
  final String? ethnic;
  final String? religion;
  final String? address;
  final String? issuePlate;
  final String? issueDate;
  final String? expiredDate;
  final String? identification;
  final String? phone;
  final String? secretKey;

  // factory RegisterRequestModel.fromJson(Map<String, dynamic> json){
  //   return RegisterRequestModel(
  //     username: json["username"],
  //     email: json["email"],
  //     password: json["password"],
  //     fullName: json["fullName"],
  //     citizenNumber: json["citizenNumber"],
  //     dateOfBirth: DateTime.tryParse(json["dateOfBirth"] ?? ""),
  //     gender: json["gender"],
  //     nationality: json["nationality"],
  //     nativeLand: json["nativeLand"],
  //     ethnic: json["ethnic"],
  //     religion: json["religion"],
  //     address: json["address"],
  //     issuePlate: json["issuePlate"],
  //     issueDate: DateTime.tryParse(json["issueDate"] ?? ""),
  //     expiredDate: DateTime.tryParse(json["expiredDate"] ?? ""),
  //     identification: json["identification"],
  //     phone: json["phone"],
  //     secretKey: json["secretKey"],
  //   );
  // }

  Map<String, dynamic> toJson() => {
    "username": username,
    "email": email,
    "password": password,
    "fullName": fullName,
    "citizenNumber": citizenNumber,
    "dateOfBirth": dateOfBirth,
    "gender": gender,
    "nationality": nationality,
    "nativeLand": nativeLand,
    "ethnic": ethnic,
    "religion": religion,
    "address": address,
    "issuePlate": issuePlate,
    "issueDate": issueDate,
    "expiredDate": expiredDate,
    "identification": identification,
    "phone": phone,
    "secretKey": secretKey,
  };

}
