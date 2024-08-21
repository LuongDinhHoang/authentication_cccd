class UserInfoModel {
  UserInfoModel({
    this.id,
    this.username,
    this.email,
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
    this.userType,
    this.status,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
  });

  final String? id;
  final String? username;
  final String? email;
  final String? fullName;
  final String? citizenNumber;
  final DateTime? dateOfBirth;
  final String? gender;
  final String? nationality;
  final String? nativeLand;
  final String? ethnic;
  final String? religion;
  final String? address;
  final String? issuePlate;
  final DateTime? issueDate;
  final DateTime? expiredDate;
  final String? identification;
  final String? phone;
  final String? userType;
  final String? status;
  final DateTime? createdAt;
  final String? createdBy;
  final DateTime? updatedAt;
  final String? updatedBy;

  factory UserInfoModel.fromJson(Map<String, dynamic> json){
    return UserInfoModel(
      id: json["id"],
      username: json["username"],
      email: json["email"],
      fullName: json["fullName"],
      citizenNumber: json["citizenNumber"],
      dateOfBirth: DateTime.tryParse(json["dateOfBirth"] ?? ""),
      gender: json["gender"],
      nationality: json["nationality"],
      nativeLand: json["nativeLand"],
      ethnic: json["ethnic"],
      religion: json["religion"],
      address: json["address"],
      issuePlate: json["issuePlate"],
      issueDate: DateTime.tryParse(json["issueDate"] ?? ""),
      expiredDate: DateTime.tryParse(json["expiredDate"] ?? ""),
      identification: json["identification"],
      phone: json["phone"],
      userType: json["userType"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      createdBy: json["createdBy"],
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      updatedBy: json["updatedBy"],
    );
  }
}
