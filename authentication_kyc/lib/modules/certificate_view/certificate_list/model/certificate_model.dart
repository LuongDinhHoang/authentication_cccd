import 'package:authentication_kyc/shares/utils/time/date_utils.dart';
class CertificateModel {
    CertificateModel({
        required this.sessionId,
        required this.verifyCertStatus,
        required this.certSerial,
        required this.certSubjectCn,
        required this.certSubjectO,
        required this.certSubjectOu,
        required this.certSubjectT,
        required this.certSubjectL,
        required this.certSubjectSt,
        required this.certSubjectC,
        required this.taxCode,
        required this.idNumber,
        required this.certValidFrom,
        required this.certValidTo,
    });

    final String sessionId;
    final int verifyCertStatus;
    final String certSerial;
    final String certSubjectCn;
    final String certSubjectO;
    final String certSubjectOu;
    final String certSubjectT;
    final String certSubjectL;
    final String certSubjectSt;
    final String certSubjectC;
    final String taxCode;
    final String idNumber;
    final DateTime? certValidFrom;
    final DateTime? certValidTo;

    factory CertificateModel.fromJson(Map<String, dynamic> json){ 
        return CertificateModel(
            sessionId: json["sessionId"] ?? "",
            verifyCertStatus: json["verifyCertStatus"] ?? 0,
            certSerial: json["certSerial"] ?? "",
            certSubjectCn: json["certSubjectCn"] ?? "",
            certSubjectO: json["certSubjectO"] ?? "",
            certSubjectOu: json["certSubjectOu"] ?? "",
            certSubjectT: json["certSubjectT"] ?? "",
            certSubjectL: json["certSubjectL"] ?? "",
            certSubjectSt: json["certSubjectSt"] ?? "",
            certSubjectC: json["certSubjectC"] ?? "",
            taxCode: json["taxCode"] ?? "",
            idNumber: json["idNumber"] ?? "",
            // certValidFrom: convertStringToDate(json["certValidFrom"] ?? "", pattern10),
            // certValidTo: convertStringToDate(json["certValidTo"] ?? "", pattern10),
            certValidFrom: convertStringToDate(json["certValidFrom"] ?? "", pattern24),
            certValidTo: convertStringToDate(json["certValidTo"] ?? "", pattern24),
        );
    }

}
