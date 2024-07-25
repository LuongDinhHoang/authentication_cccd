import 'package:easy_ca/hive_helper/hive_adapters.dart';
import 'package:easy_ca/hive_helper/hive_types.dart';
import 'package:hive/hive.dart';

import '../../../../../hive_helper/fields/login_ca_request_model_fields.dart';

part 'login_ca_request_model.g.dart';

@HiveType(
    typeId: HiveTypes.loginCaRequestModel,
    adapterName: HiveAdapters.loginCaRequestModel)
class LoginCaRequestModel extends HiveObject {
  @HiveField(LoginCaRequestModelFields.userName)
  String userName;

  @HiveField(LoginCaRequestModelFields.password)
  String password;

  @HiveField(LoginCaRequestModelFields.isRememberMe)
  bool isRememberMe;

  LoginCaRequestModel({
    required this.userName,
    required this.password,
    required this.isRememberMe,
  });

  Map<String, dynamic> toJson() => {
        "username": userName,
        "password": password,
        "rememberMe": isRememberMe,
      };
}
