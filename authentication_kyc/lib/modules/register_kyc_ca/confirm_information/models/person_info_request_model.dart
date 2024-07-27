class PersonInfoRequestModel {
  PersonInfoRequestModel({
    required this.sessionId,
    required this.number,
    required this.name,
    required this.dob,
    required this.sex,
    required this.issueDate,
    required this.doe,
    required this.issueOrg,
    required this.por,
    required this.poo,
    required this.phoneNumber,
    required this.email,
  });

  String sessionId;
  String number;
  String name;
  String dob;
  String sex;
  String issueDate;
  String doe;
  String issueOrg;
  String por;
  String poo;
  String phoneNumber;
  String email;

  factory PersonInfoRequestModel.fromJson(Map<String, dynamic> json){
    return PersonInfoRequestModel(
      sessionId: json["sessionId"] ?? "",
      number: json["number"] ?? "",
      name: json["name"] ?? "",
      dob: json["dob"] ?? "",
      sex: json["sex"] ?? "",
      issueDate: json["issueDate"] ?? "",
      doe: json["doe"] ?? "",
      issueOrg: json["issueOrg"] ?? "",
      por: json["por"] ?? "",
      poo: json["poo"] ?? "",
      phoneNumber: json["phoneNumber"] ?? "",
      email: json["email"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "sessionId": sessionId,
      "number": number,
      "name": name,
      "dob": dob,
      "sex": sex,
      "issueDate": issueDate,
      "doe": doe,
      "issueOrg": issueOrg,
      "por": por,
      "poo": poo,
      "phoneNumber": phoneNumber,
      "email": email,
    };
  }

}
