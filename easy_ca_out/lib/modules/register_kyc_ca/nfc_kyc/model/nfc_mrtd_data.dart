import 'dart:typed_data';

import 'package:dmrtd/dmrtd.dart';
import 'package:dmrtd/extensions.dart';
import 'package:intl/intl.dart';

class MrtdData {
  EfCardAccess? cardAccess;
  EfCardSecurity? cardSecurity;
  EfCOM? com;
  EfSOD? sod;
  EfDG1? dg1;
  EfDG2? dg2;
  EfDG3? dg3;
  EfDG4? dg4;
  EfDG5? dg5;
  EfDG6? dg6;
  EfDG7? dg7;
  EfDG8? dg8;
  EfDG9? dg9;
  EfDG10? dg10;
  EfDG11? dg11;
  EfDG12? dg12;
  EfDG13? dg13;
  EfDG14? dg14;
  EfDG15? dg15;
  EfDG16? dg16;
  Uint8List? aaSig;
  bool? isPACE;
  bool? isDBA;
}

final Map<DgTag, String> dgTagToString = {
  EfDG1.TAG: 'EF.DG1',
  EfDG2.TAG: 'EF.DG2',
  EfDG3.TAG: 'EF.DG3',
  EfDG4.TAG: 'EF.DG4',
  EfDG5.TAG: 'EF.DG5',
  EfDG6.TAG: 'EF.DG6',
  EfDG7.TAG: 'EF.DG7',
  EfDG8.TAG: 'EF.DG8',
  EfDG9.TAG: 'EF.DG9',
  EfDG10.TAG: 'EF.DG10',
  EfDG11.TAG: 'EF.DG11',
  EfDG12.TAG: 'EF.DG12',
  EfDG13.TAG: 'EF.DG13',
  EfDG14.TAG: 'EF.DG14',
  EfDG15.TAG: 'EF.DG15',
  EfDG16.TAG: 'EF.DG16'
};

String formatEfCom(final EfCOM efCom) {
  var str = "version: ${efCom.version}\n"
      "unicode version: ${efCom.unicodeVersion}\n"
      "DG tags:";

  for (final t in efCom.dgTags) {
    try {
      str += " ${dgTagToString[t]!}";
    } catch (e) {
      str += " 0x${t.value.toRadixString(16)}";
    }
  }
  return str;
}

String formatMRZ(final MRZ mrz) {
  return "MRZ\n"
          "  version: ${mrz.version}\n" +
      "  doc code: ${mrz.documentCode}\n" +
      "  doc No.: ${mrz.documentNumber}\n" +
      "  country: ${mrz.country}\n" +
      "  nationality: ${mrz.nationality}\n" +
      "  name: ${mrz.firstName}\n" +
      "  surname: ${mrz.lastName}\n" +
      "  gender: ${mrz.gender}\n" +
      "  date of birth: ${DateFormat.yMd().format(mrz.dateOfBirth)}\n" +
      "  date of expiry: ${DateFormat.yMd().format(mrz.dateOfExpiry)}\n" +
      "  add. data: ${mrz.optionalData}\n" +
      "  add. data: ${mrz.optionalData2}";
}

String formatDG15(final EfDG15 dg15) {
  var str = "EF.DG15:\n"
      "  AAPublicKey\n"
      "    type: ";

  final rawSubPubKey = dg15.aaPublicKey.rawSubjectPublicKey();
  if (dg15.aaPublicKey.type == AAPublicKeyType.RSA) {
    final tvSubPubKey = TLV.fromBytes(rawSubPubKey);
    var rawSeq = tvSubPubKey.value;
    if (rawSeq[0] == 0x00) {
      rawSeq = rawSeq.sublist(1);
    }

    final tvKeySeq = TLV.fromBytes(rawSeq);
    final tvModule = TLV.decode(tvKeySeq.value);
    final tvExp = TLV.decode(tvKeySeq.value.sublist(tvModule.encodedLen));

    str += "RSA\n"
        "    exponent: ${tvExp.value.hex()}\n"
        "    modulus: ${tvModule.value.hex()}";
  } else {
    str += "EC\n    SubjectPublicKey: ${rawSubPubKey.hex()}";
  }
  return str;
}

String formatProgressMsg(String message, int percentProgress) {
  final p = (percentProgress / 20).round();
  final full = "🟢 " * p;
  final empty = "⚪️ " * (5 - p);
  return message + "\n\n" + full + empty;
}
