class OCRDataModel {
  OCRDataModel({
    this.number,
    this.name,
    this.dob,
    this.sex,
    this.nationality,
    this.poo,
    this.por,
    this.doe,
    this.mrz,
    this.issueDate,
    this.issueOrg,
    this.aiStatus,
    this.aiMessage,
  });

  String? number;
  String? name;
  String? dob;
  String? sex;
  String? nationality;
  String? poo;
  String? por;
  String? doe;
  String? mrz;
  String? issueDate;
  String? issueOrg;
  int? aiStatus;
  String? aiMessage;

  factory OCRDataModel.fromJson(Map<String, dynamic> json) {
    return OCRDataModel(
      number: json["number"],
      name: json["name"],
      dob: json["dob"],
      sex: json["sex"],
      nationality: json["nationality"],
      poo: json["poo"],
      por: json["por"],
      doe: json["doe"],
      mrz: json["mrz"],
      issueDate: json["issueDate"],
      issueOrg: json["issueOrg"],
      aiStatus: json["AI_status"],
      aiMessage: json["AI_message"],
    );
  }

  Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
        "dob": dob,
        "sex": sex,
        "nationality": nationality,
        "poo": poo,
        "por": por,
        "doe": doe,
        "MRZ": mrz,
        "issue_date": issueDate,
        "issue_org": issueOrg,
      };
}
