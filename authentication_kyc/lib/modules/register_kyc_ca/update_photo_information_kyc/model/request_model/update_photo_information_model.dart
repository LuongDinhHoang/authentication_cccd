// class UpdatePhotoInformationModel {
//   UpdatePhotoInformationModel({
//     this.number,
//     this.name,
//     this.dob,
//     this.sex,
//     this.nationality,
//     this.poo,
//     this.por,
//     this.doe,
//     this.mrz,
//     this.issueDate,
//     this.issueOrg,
//   });
//
//   final String? number;
//   final String? name;
//   final String? dob;
//   final String? sex;
//   final String? nationality;
//   final String? poo;
//   final String? por;
//   final String? doe;
//   final String? mrz;
//   final String? issueDate;
//   final String? issueOrg;
//
//   factory UpdatePhotoInformationModel.fromJson(Map<String, dynamic> json){
//     return UpdatePhotoInformationModel(
//       number: json["number"],
//       name: json["name"],
//       dob: json["dob"],
//       sex: json["sex"],
//       nationality: json["nationality"],
//       poo: json["poo"],
//       por: json["por"],
//       doe: json["doe"],
//       mrz: json["MRZ"],
//       issueDate: json["issue_date"],
//       issueOrg: json["issue_org"],
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     "number": number,
//     "name": name,
//     "dob": dob,
//     "sex": sex,
//     "nationality": nationality,
//     "poo": poo,
//     "por": por,
//     "doe": doe,
//     "MRZ": mrz,
//     "issue_date": issueDate,
//     "issue_org": issueOrg,
//   };
//
// }
