class QrUserInformation {
  QrUserInformation(
      {this.documentNumber,
      this.fullName,
      this.dateOfBirth,
      this.gender,
      this.address,
      this.dateOfIssuer,
      this.raw,
      this.informationIdCard});

  String? documentNumber;
  String? fullName;
  String? dateOfBirth;
  String? gender;
  String? address;
  String? dateOfIssuer;
  String? raw;
  String? informationIdCard;
  String? dateOfExpiry;


  factory QrUserInformation.fromJson(Map<String, dynamic> json) {
    return QrUserInformation(
      documentNumber: json["DocumentNumber"],
      fullName: json["FullName"],
      dateOfBirth: json["DateOfBirth"],
      gender: json["Gender"],
      address: json["Address"],
      dateOfIssuer: json["DateOfIssuer"],
      raw: json["Raw"],
    );
  }

  Map<String, dynamic> toJson() => {
        "DocumentNumber": documentNumber,
        "FullName": fullName,
        "DateOfBirth": dateOfBirth,
        "Gender": gender,
        "Address": address,
        "DateOfIssuer": dateOfIssuer,
        "Raw": raw,
      };

  Map<String, dynamic> toJsonCic() => {
        "identificationDiff": informationIdCard,
        "identification": documentNumber,
        "fullName": fullName,
        "dateOfBirth": dateOfBirth,
        "gender": gender == null
            ? null
            : gender == "Nam"
                ? 1
                : 2,
        "address": address,
        "issueDate": dateOfIssuer
      };
}
