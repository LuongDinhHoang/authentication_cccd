class UserInfoModel {
  UserInfoModel({
    this.id,
    this.login,
    this.firstName,
    this.lastName,
    this.email,
    this.imageUrl,
    this.activated,
    this.langKey,
    this.fullName,
    this.notificationType,
    this.type,
    this.status,
    this.updatedBy,
    this.createdBy,
    this.createdDate,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.authorities,
    this.phone,
    this.autoApproval,
    this.skipPayment,
    this.documentNumber,
  });

  final int? id;
  final String? login;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? imageUrl;
  final bool? activated;
  final String? langKey;
  final String? fullName;
  final dynamic notificationType;
  final int? type;
  final int? status;
  final String? updatedBy;
  final String? createdBy;
  final DateTime? createdDate;
  final String? lastModifiedBy;
  final DateTime? lastModifiedDate;
  final List<String>? authorities;
  final String? phone;
  final bool? autoApproval;
  final bool? skipPayment;
  final String? documentNumber;

  factory UserInfoModel.fromJson(Map<String, dynamic> json){
    return UserInfoModel(
      id: json["id"],
      login: json["login"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      email: json["email"],
      imageUrl: json["imageUrl"],
      activated: json["activated"],
      langKey: json["langKey"],
      fullName: json["fullName"],
      notificationType: json["notificationType"],
      type: json["type"],
      status: json["status"],
      updatedBy: json["updatedBy"],
      createdBy: json["createdBy"],
      createdDate: DateTime.tryParse(json["createdDate"] ?? ""),
      lastModifiedBy: json["lastModifiedBy"],
      lastModifiedDate: DateTime.tryParse(json["lastModifiedDate"] ?? ""),
      authorities: json["authorities"] == null ? [] : List<String>.from(json["authorities"]!.map((x) => x)),
      phone: json["phone"],
      autoApproval: json["autoApproval"],
      skipPayment: json["skipPayment"],
      documentNumber: json["cccd"],
    );
  }

}
