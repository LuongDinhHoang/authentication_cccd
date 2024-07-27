class ListPackageModel {
  ListPackageModel({
    required this.usbToken,
    required this.hsm,
    required this.remoteSigning,
  });

  final List<PackageInfoResponse> usbToken;
  final List<PackageInfoResponse> hsm;
  final List<PackageInfoResponse> remoteSigning;
}

class PackageInfoResponse {
  PackageInfoResponse({
    this.serviceName,
    this.certType,
    this.expiry,
    this.defaultPackage,
    this.price,
    this.namePackTms,
    this.tokenType,
  });

  String? serviceName;
  String? certType;
  int? expiry;
  bool? defaultPackage;
  int? price;
  String? namePackTms;
  String? tokenType;


  factory PackageInfoResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return PackageInfoResponse(
      serviceName: json["serviceName"] ?? "",
      certType: json["certType"] ?? "",
      expiry: json["expiry"] ?? 0,
      defaultPackage: json["defaultPackage"] ?? false,
      price: json["price"],
      namePackTms: json["namePackTms"] ?? "",
      tokenType: json["tokenType"] ?? "",
    );
  }
}

