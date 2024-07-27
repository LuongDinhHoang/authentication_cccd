import 'package:hive/hive.dart';

import '../modules/register_kyc_ca/verify_profile_ca/models/login_ca_model/login_ca_request_model.dart';

void registerAdapters() {
	Hive.registerAdapter(LoginCaRequestModelAdapter());
}
