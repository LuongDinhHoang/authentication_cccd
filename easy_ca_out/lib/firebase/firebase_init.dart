import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

class FirebaseInit {
  static final FirebaseInit _singleton = FirebaseInit._internal();

  factory FirebaseInit() {
    return _singleton;
  }

  FirebaseInit._internal();

  UserCredential? userCredential;

  Future<void> initializeFlutterFire() async {
    if (GetPlatform.isMobile) {
      try {
        WidgetsFlutterBinding.ensureInitialized();
        await Firebase.initializeApp(
            // options: DefaultFirebaseOptions.currentPlatform
        );

        userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: 'easycasoftdreams@gmail.com',
          password: 'SDS@Ca2o24',
        );
      } catch (e) {
        log(e.toString());
      }
    }
  }
}
