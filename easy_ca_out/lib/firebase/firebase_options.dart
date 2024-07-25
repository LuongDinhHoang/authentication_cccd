// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {


    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
              'you can reconfigure this by running the FlutterFire CLI again.',
        );
      //   return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
              'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
              'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCEErAgsSaRwEVZeKM1CiKEhOW_dx8rmsI',
    appId: '1:179883609380:android:f95483ed5e008869e937b1',
    messagingSenderId: '179883609380',
    projectId: 'easy-kyc',
    storageBucket: 'easy-kyc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD0zM-Ydq-TASzuV4J_AlUcrjAAk1kYj7s',
    appId: '1:130292311535:ios:42bd5c8e67e352f740821a',
    messagingSenderId: '130292311535',
    projectId: 'easyhrm-1f1fa',
    storageBucket: 'easyhrm-1f1fa.appspot.com',
    androidClientId:
    '130292311535-jg6ld8v77pvuoqr6htkgj6b7i8m66rmt.apps.googleusercontent.com',
    iosClientId:
    '130292311535-9d9hg5kd20k0bejjq4ad0b5cq9bq4t25.apps.googleusercontent.com',
    iosBundleId: 'com.example.hrmMobile',
  );

}
