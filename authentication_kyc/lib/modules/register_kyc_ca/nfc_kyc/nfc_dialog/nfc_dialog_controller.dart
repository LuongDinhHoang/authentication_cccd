import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:asn1lib/asn1lib.dart';
import 'package:dmrtd/dmrtd.dart';
import 'package:dmrtd/extensions.dart';
import 'package:dmrtd/src/proto/can_key.dart';
import 'package:two_id_c06verify/base_app/base_app.src.dart';
import 'package:two_id_c06verify/core/core.src.dart';
import 'package:two_id_c06verify/generated/locales.g.dart';
import 'package:two_id_c06verify/modules/register_kyc_ca/nfc_kyc/nfc_kyc.src.dart';
import 'package:two_id_c06verify/shares/utils/time/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NfcDialogController extends BaseGetxController {
  final AppController appController = Get.find<AppController>();

  // final NfcController nfcController = Get.find();
  //
  // late DataOcrModel dataOcrModel;
  // UserModel userModel = UserModel();
  String? idDocument;
  DateTime? dateOfBirth;
  DateTime? dateOfExpiry;
  Rx<MrtdData>? mrtdData;
  SendNfcRequestModel sendNfcRequestModel = SendNfcRequestModel();
  RxBool readComplete = false.obs;
  final NfcProvider nfc = NfcProvider();
  final scrollController = ScrollController();
  RxBool isReading = false.obs;

  RxInt processQuantity = 0.obs;
  int maxProcess = 10;

  @override
  Future<void> onInit() async {
    // dataOcrModel = Get.arguments;
    setupData();
    // userModel = UserModel();
    await readMRTD();
    if (sendNfcRequestModel.number != null) {
      if (Get.isDialogOpen == true) {
        Get.back();
      }
      Get.toNamed(
        AppRoutes.routeNfcInformationUser,
        arguments: sendNfcRequestModel,
      );
    } else {
      if (Get.isDialogOpen == true) {
        Get.back();
      }
      showSnackBar(LocaleKeys.nfc_nfcError.tr);
    }
    super.onInit();
  }

  void setupData() {
    // final backCardMrz =
    //     appController.dataOcrModel.responseEkyc?.backCardResponse?.data?.mrz;
    // if (backCardMrz != null) {
    //   idDocument = backCardMrz.idNumber.toString().substring(3);
    //   dateOfBirth = getDate(backCardMrz.dobYymmdd ?? "");
    //   dateOfExpiry = getDate(backCardMrz.expYymmdd ?? "");
    // }
    try {
      if (appController.authProfileRequestModel.identity != null) {
        if (appController.authProfileRequestModel.identity!.length > 6) {
          idDocument = appController.authProfileRequestModel.identity;
        }
      } else {
        if (appController.qrUserInformation.documentNumber != null) {
          if (appController.qrUserInformation.documentNumber!.length > 3) {
            idDocument = appController.qrUserInformation.documentNumber;
          }
        }
        dateOfBirth = convertDateToDate(
            convertStringToDate(
              appController.qrUserInformation.dateOfBirth,
              pattern1,
            ),
            patternDefault);
        dateOfExpiry = convertDateToDate(
            convertStringToDate(
              appController.qrUserInformation.dateOfExpiry,
              pattern1,
            ),
            patternDefault);
      }
      // idDocument = "099006031";
      // dateOfBirth = convertDateToDate(
      //     convertStringToDate(
      //       "16/07/1999",
      //       pattern1,
      //     ),
      //     patternDefault);
      // dateOfExpiry = convertDateToDate(
      //     convertStringToDate(
      //       "16/07/2039",
      //       pattern1,
      //     ),
      //     patternDefault);
    } catch (e) {
      idDocument = dateOfBirth = dateOfExpiry = null;
    }
  }

  // DateTime? getDate(String date) {
  //   if (date.isEmpty) {
  //     return null;
  //   }
  //   String year = '20${date.substring(0, 2)}'; // Lấy năm từ chuỗi
  //   String month = date.substring(2, 4); // Lấy tháng từ chuỗi
  //   String day = date.substring(4); // Lấy ngày từ chuỗi
  //
  //   String formattedDate =
  //       '$year-$month-$day'; // Kết hợp thành chuỗi theo định dạng yyyy-MM-dd
  //
  //   // Chuyển đổi chuỗi thành DateTime
  //   DateTime dateTime = DateFormat('yyyy-MM-dd').parse(formattedDate);
  //   return dateTime;
  // }

  Future<void> readMRTD({bool isPace = true}) async {
    try {
      processQuantity.value = 0;
      await nfc.connect(
          timeout: const Duration(seconds: 10),
          iosAlertMessage: LocaleKeys.nfc_introduceScanNfc1.tr);
      processQuantity.value = 2;
      isReading.value = true;
      final passport = Passport(nfc);
      // nfc.setIosAlertMessage(LocaleKeys.nfc_introduceScanNfc2.tr);
      final mrtdDataTemp = MrtdData();
      // try {
      //   mrtdDataTemp.cardAccess = await passport.readEfCardAccess();
      // } on PassportError {
      //   //if (e.code != StatusWord.fileNotFound) rethrow;
      // }
      // nfc.setIosAlertMessage(LocaleKeys.nfc_introduceScanNfc3.tr);

      // try {
      //   mrtdDataTemp.cardSecurity = await passport.readEfCardSecurity();
      // } on PassportError {
      //   // if (e.code != StatusWord.fileNotFound) rethrow;
      // }
      nfc.setIosAlertMessage(LocaleKeys.nfc_introduceScanNfc4.tr);
      if (isPace) {
        final accessKey = CanKey(idDocument!.substring(6));
        final efCardAccessData = AppConst.keyAccessDataNFCIos.parseHex();

        EfCardAccess efCardAccess = EfCardAccess.fromBytes(efCardAccessData);
        //PACE session
        await passport.startSessionPACE(accessKey, efCardAccess);
      } else {
        final bacKeySeed = DBAKey(idDocument ?? "",
            dateOfBirth ?? DateTime.now(), dateOfExpiry ?? DateTime.now());
        await passport.startSession(bacKeySeed);
      }

      processQuantity.value = 4;
      nfc.setIosAlertMessage(
          formatProgressMsg(LocaleKeys.nfc_introduceScanNfc5.tr, 20));
      mrtdDataTemp.com = await passport.readEfCOM();

      if (mrtdDataTemp.com!.dgTags.contains(EfDG1.TAG)) {
        mrtdDataTemp.dg1 = await passport.readEfDG1();
      }
      if (mrtdDataTemp.com!.dgTags.contains(EfDG2.TAG)) {
        mrtdDataTemp.dg2 = await passport.readEfDG2();
      }

      nfc.setIosAlertMessage(
          formatProgressMsg(LocaleKeys.nfc_introduceScanNfc6.tr, 40));
      // if (mrtdDataTemp.com!.dgTags.contains(EfDG3.TAG)) {
      //   mrtdDataTemp.dg3 = await passport.readEfDG3();
      // }
      // if (mrtdDataTemp.com!.dgTags.contains(EfDG4.TAG)) {
      //   mrtdDataTemp.dg4 = await passport.readEfDG4();
      // }
      // if (mrtdDataTemp.com!.dgTags.contains(EfDG5.TAG)) {
      //   mrtdDataTemp.dg5 = await passport.readEfDG5();
      // }
      // if (mrtdDataTemp.com!.dgTags.contains(EfDG6.TAG)) {
      //   mrtdDataTemp.dg6 = await passport.readEfDG6();
      // }
      // if (mrtdDataTemp.com!.dgTags.contains(EfDG7.TAG)) {
      //   mrtdDataTemp.dg7 = await passport.readEfDG7();
      // }
      // if (mrtdDataTemp.com!.dgTags.contains(EfDG8.TAG)) {
      //   mrtdDataTemp.dg8 = await passport.readEfDG8();
      // }
      // if (mrtdDataTemp.com!.dgTags.contains(EfDG9.TAG)) {
      //   mrtdDataTemp.dg9 = await passport.readEfDG9();
      // }
      // if (mrtdDataTemp.com!.dgTags.contains(EfDG10.TAG)) {
      //   mrtdDataTemp.dg10 = await passport.readEfDG10();
      // }
      // if (mrtdDataTemp.com!.dgTags.contains(EfDG11.TAG)) {
      //   mrtdDataTemp.dg11 = await passport.readEfDG11();
      // }
      // if (mrtdDataTemp.com!.dgTags.contains(EfDG12.TAG)) {
      //   mrtdDataTemp.dg12 = await passport.readEfDG12();
      // }
      if (mrtdDataTemp.com!.dgTags.contains(EfDG13.TAG)) {
        mrtdDataTemp.dg13 = await passport.readEfDG13();
      }
      if (mrtdDataTemp.com!.dgTags.contains(EfDG14.TAG)) {
        mrtdDataTemp.dg14 = await passport.readEfDG14();
      }
      nfc.setIosAlertMessage(
          formatProgressMsg(LocaleKeys.nfc_introduceScanNfc7.tr, 60));

      if (mrtdDataTemp.com!.dgTags.contains(EfDG15.TAG)) {
        mrtdDataTemp.dg15 = await passport.readEfDG15();
        mrtdDataTemp.aaSig = await passport.activeAuthenticate(Uint8List(8));
      }

      formatProgressMsg(LocaleKeys.nfc_introduceScanNfc7.tr, 60);
      processQuantity.value = 6;
      nfc.setIosAlertMessage(
          formatProgressMsg(LocaleKeys.nfc_introduceScanNfc8.tr, 80));
      mrtdDataTemp.sod = await passport.readEfSOD();
      mrtdData?.value = mrtdDataTemp;

      sendNfcRequestModel.sessionId = hiveApp.get(AppKey.sessionId);
      sendNfcRequestModel.type = "ID";
      _getDgGlobal(mrtdDataTemp);

      // String decodedString =
      //     utf8.decode(mrtdDataTemp.dg13!.toBytes(), allowMalformed: true);
      // String rawData = removeSpecialCharacters(decodedString);
      // sendNfcRequestModel.raw = rawData;
      // List<String> parts = rawData.split('\n');
      // parts = parts
      //     .where((part) => part.isNotEmpty)
      //     .map((part) => part.trim())
      //     .toList();
      // List<String> resultList = parts;
      // _getDg13Name(resultList[0].trim());
      // _getDg13Date(resultList[1].trim());
      // if (resultList.length == 6) {
      //   _getDg13HomeTown(resultList[2].trim());
      //   _getDg13IdentificationSigns(resultList[3].trim());
      //   _getDg13RegistrationDate(resultList[4].trim());
      //   getDg13Relatives(resultList[5].trim());
      // } else if (resultList.length == 7) {
      //   sendNfcRequestModel.nationalityVMN =
      //       cutStringUntilFirstDigit(resultList[2].trim(), minus: 0);
      //   _getDg13HomeTown(resultList[3].trim());
      //   _getDg13IdentificationSigns(resultList[4].trim());
      //   _getDg13RegistrationDate(resultList[5].trim());
      //   getDg13Relatives(resultList[6].trim());
      // }
      sendNfcRequestModel.otherPaper =
          appController.qrUserInformation.informationIdCard;
      sendNfcRequestModel.mrz = removeSpecialCharacters(
          utf8.decode(mrtdDataTemp.dg1!.toBytes(), allowMalformed: true));

      ///conver Dg13 VNM
      String decodedString =
          utf8.decode(mrtdDataTemp.dg13!.toBytes(), allowMalformed: true);
      String rawData = removeSpecialCharacters(decodedString);
      sendNfcRequestModel.raw = rawData;
      _getDg13VNM(mrtdDataTemp.dg13!.toBytes());

      processQuantity.value = 10;
      await nfc.disconnect();
    } catch (e) {
      await nfc.disconnect(iosErrorMessage: LocaleKeys.nfc_introduceScanNfcError.tr);
      // nfc.setIosAlertMessage("Lỗi quét NFC. Quý khách vui lòng thử lại !");
      processQuantity.value = 0;
      if (Get.isDialogOpen == true) {
        Get.back();
      }
      /*alertMsg.value = "Đã có lỗi xảy ra, vui lòng thử lại";
      final se = e.toString().toLowerCase();
      if (e is PassportError) {
        if (se.contains("security status not satisfied")) {
          alertMsg.value =
          "Failed to initiate session with passport.\nCheck input data!";
        }
      }

      if (se.contains('timeout')) {
        alertMsg.value = "Timeout while waiting for Passport tag";
      } else if (se.contains("tag was lost")) {
        alertMsg.value = "Tag was lost. Please try again!";
      } else if (se.contains("invalidated by user")) {
        alertMsg.value = "";
      }*/
/*      if (!GetPlatform.isIOS) {
        showSnackBar(alertMsg.value);
      }*/
    } finally {
      // processQuantity.value = 0;
      isReading.value = false;
    }
  }

  void _getDgGlobal(MrtdData mrtdDataTemp) {
    sendNfcRequestModel.number =
        mrtdDataTemp.dg1?.mrz.optionalData.substring(0, 12);
    sendNfcRequestModel.name =
        "${mrtdDataTemp.dg1?.mrz.lastName} ${mrtdDataTemp.dg1?.mrz.firstName}";
    sendNfcRequestModel.firstName = mrtdDataTemp.dg1?.mrz.firstName;
    sendNfcRequestModel.lastName = mrtdDataTemp.dg1?.mrz.lastName;
    sendNfcRequestModel.dob = mrtdDataTemp.dg1?.mrz.dateOfBirth.toString();
    sendNfcRequestModel.doe = mrtdDataTemp.dg1?.mrz.dateOfExpiry.toString();
    sendNfcRequestModel.sex = mrtdDataTemp.dg1?.mrz.gender;
    sendNfcRequestModel.nationality = mrtdDataTemp.dg1?.mrz.country;
    sendNfcRequestModel.mrz = removeSpecialCharacters(
        utf8.decode(mrtdDataTemp.dg1!.toBytes(), allowMalformed: true));
    sendNfcRequestModel.file =
        mrtdDataTemp.dg2?.toBytes().base64().substring(112);
    sendNfcRequestModel.aaSignature = mrtdDataTemp.dg14?.toBytes().base64();
    sendNfcRequestModel.aaPublicKey =
        mrtdDataTemp.dg15?.aaPublicKey.toBytes().base64();
    sendNfcRequestModel.keyAlg = mrtdDataTemp.dg15?.aaPublicKey.type.toString();
  }

  void _getDg13VNM(Uint8List byteDg13) {
    Uint8List encodedData = Uint8List.fromList(byteDg13);
    ASN1Parser parser = ASN1Parser(encodedData);
    ASN1Object asn1Object = parser.nextObject();
    if (asn1Object is ASN1Sequence) {
      ASN1Sequence sequence = asn1Object;
      String asn1Data = sequence.elements[0].toString();
      RegExp regex = RegExp(r'(UTF8String|PrintableString)\((.*?)\)');
      Iterable<Match> matches = regex.allMatches(asn1Data);
      List<String> listDg13 = [];
      for (Match match in matches) {
        // String stringType = match.group(1)??"";
        String value = match.group(2) ?? "";
        listDg13.add(value);
      }
      if (listDg13.length >= 15) {
        sendNfcRequestModel.numberVMN = listDg13[0];
        sendNfcRequestModel.nameVNM = listDg13[1];
        sendNfcRequestModel.dobVMN = listDg13[2];
        sendNfcRequestModel.sexVMN = listDg13[3];
        sendNfcRequestModel.nationalityVMN = listDg13[4];
        sendNfcRequestModel.nationVNM = listDg13[5];
        sendNfcRequestModel.religionVMN = listDg13[6];
        sendNfcRequestModel.homeTownVMN = listDg13[7];
        sendNfcRequestModel.residentVMN = listDg13[8];
        sendNfcRequestModel.identificationSignsVNM = listDg13[9];
        sendNfcRequestModel.registrationDateVMN = listDg13[10];
        sendNfcRequestModel.doeVMN = listDg13[11];
        sendNfcRequestModel.nameDadVMN = listDg13[12];
        sendNfcRequestModel.nameMomVMN = listDg13[13];
        if (listDg13.length == 16) {
          if (startsWithNumber(listDg13[14])) {
            sendNfcRequestModel.otherPaper = listDg13[14];
          } else {
            sendNfcRequestModel.nameCouple = listDg13[14];
          }
        } else if (listDg13.length == 17) {
          if (startsWithNumber(listDg13[15])) {
            sendNfcRequestModel.otherPaper = listDg13[15];
            sendNfcRequestModel.nameCouple = listDg13[14];
          } else {
            sendNfcRequestModel.otherPaper = listDg13[14];
            sendNfcRequestModel.nameCouple = listDg13[15];
          }
        }
      }
    }
  }

  bool startsWithNumber(String input) {
    if (input.isEmpty) {
      return false;
    }

    String firstChar = input.substring(0, 1);
    return int.tryParse(firstChar) != null;
  }

  /* void _getDg13Name(String input) async {
    input = input.trim().substring(4);
    sendNfcRequestModel.numberVMN = cutStringUntilFirstLetter(input).trim();
    sendNfcRequestModel.nameVNM = cutStringUntilLastLetter(input).trim();
  }

  void _getDg13Date(String input) async {
    sendNfcRequestModel.dobVMN = cutStringUntilFirstLetter(input.trim()).trim();
    sendNfcRequestModel.sexVMN = cutStringUntilLastLetter(input.trim()).trim();
  }

  void _getDg13HomeTown(String input) async {
    List<String> parts = removeSpecialCharacters(input).split('0');
    if (parts.length == 6) {
      sendNfcRequestModel.nationalityVMN = parts[0].trim();
      sendNfcRequestModel.nationVNM = parts[1].trim();
      sendNfcRequestModel.religionVMN = parts[2].trim();
      sendNfcRequestModel.homeTownVMN = parts[3].trim();
      sendNfcRequestModel.residentVMN =
          cutStringUntilLastLetter(parts[4], minus: 0).trim();
    } else if (parts.length == 5) {
      sendNfcRequestModel.nationVNM = parts[0].trim();
      sendNfcRequestModel.religionVMN = parts[1].trim();
      sendNfcRequestModel.homeTownVMN = parts[2].trim();
      sendNfcRequestModel.residentVMN =
          cutStringUntilLastLetter(parts[3], minus: 0).trim();
    } else if (parts.length > 5) {
      sendNfcRequestModel.nationalityVMN = parts[0].trim();
      sendNfcRequestModel.nationVNM = parts[1].trim();
      sendNfcRequestModel.religionVMN = parts[2].trim();
      sendNfcRequestModel.homeTownVMN = parts[3].trim();
      for (int i = parts.length - 1; i >= 0; i--) {
        if (parts[i].length > 10) {
          sendNfcRequestModel.residentVMN =
              cutStringUntilLastLetter(parts[i], minus: 0).trim();
          break;
        }
      }
    }
  }

  void _getDg13IdentificationSigns(String input) async {
    sendNfcRequestModel.identificationSignsVNM =
        cutStringUntilLastLetter(input).trim();
  }

  void _getDg13RegistrationDate(String input) async {
    sendNfcRequestModel.registrationDateVMN =
        input.substring(0, input.length - 1).trim();
  }

  void getDg13Relatives(String input) async {
    sendNfcRequestModel.doeVMN =
        cutStringUntilFirstLetter(input, minus: 5).trim();
    sendNfcRequestModel.nameDadVMN =
        cutStringUntilFirstDigit(cutStringUntilLastLetter(input), minus: 0)
            .trim();
    sendNfcRequestModel.nameMomVMN = cutStringUntilFirstDigit(
            cutStringUntilLastDigit(cutStringUntilLastLetter(input, minus: 0)),
            minus: 0)
        .trim();
    sendNfcRequestModel.nameCouple = cutStringUntilFirstDigit(
            cutStringUntilLastDigit(
                cutStringUntilLastDigit(
                    cutStringUntilLastLetter(input, minus: 0),
                    startMinus: 1),
                startMinus: 2),
            minus: 0)
        .trim();
  }

  String cutStringUntilFirstLetter(String input, {int minus = 2}) {
    for (int i = 0; i < input.length; i++) {
      if (input[i].toUpperCase() != input[i].toLowerCase()) {
        return input.substring(0, i - minus);
      }
    }
    return input;
  }

  String cutStringUntilLastLetter(String input, {int minus = 1}) {
    for (int i = 0; i < input.length; i++) {
      if (input[i].toUpperCase() != input[i].toLowerCase()) {
        return input.substring(i, input.length - minus);
      }
    }
    return input;
  }

  String cutStringUntilFirstDigit(String input, {int minus = 1}) {
    RegExp regExp = RegExp(r'\d');
    Match? match = regExp.firstMatch(input);
    if (match != null) {
      return input.substring(0, match.start - minus);
    }
    return input;
  }

  String cutStringUntilLastDigit(String input,
      {int minus = 1, int startMinus = 1}) {
    RegExp regExp = RegExp(r'\d');
    Match? match = regExp.firstMatch(input);
    if (match != null) {
      return input.substring(match.start + startMinus, input.length - minus);
    }
    return input;
  }*/

  String removeSpecialCharacters(String input) {
    return input.replaceAll(
        RegExp(
            r'[^\w\s\r\f\t,:/-áàảãạăắằẳẵặâấầẩẫậéèẻẽẹêếềểễệíìỉĩịóòỏõọôốồổỗộơớờởỡợúùủũụưứừửữựýỳỷỹỵÁÀẢÃẠĂẮẰẲẴẶÂẤẦẨẪẬÉÈẺẼẸÊẾỀỂỄỆÍÌỈĨỊÓÒỎÕỌÔỐỒỔỖỘƠỚỜỞỠỢÚÙỦŨỤƯỨỪỬỮỰÝỲỶỸỴđĐ]'),
        '');
  }
}
