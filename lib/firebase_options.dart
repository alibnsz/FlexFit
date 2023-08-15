// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBFpNyfNvwS_F0jl20GmQzpAKzsQhLdCuw',
    appId: '1:1057237681668:web:3de3713b15c81ed1b6d751',
    messagingSenderId: '1057237681668',
    projectId: 'flutterapps-f42c8',
    authDomain: 'flutterapps-f42c8.firebaseapp.com',
    storageBucket: 'flutterapps-f42c8.appspot.com',
    measurementId: 'G-08ZCME4GH2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC5y25LWRH3fNq2U8Q9mIpJcg9IIQTTZ3k',
    appId: '1:1057237681668:android:2c4a75d7fc21dd89b6d751',
    messagingSenderId: '1057237681668',
    projectId: 'flutterapps-f42c8',
    storageBucket: 'flutterapps-f42c8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDhbAvTLQqsCQUf1ORqqXuqbFmU0aT-C7s',
    appId: '1:1057237681668:ios:47de9cc08b519a83b6d751',
    messagingSenderId: '1057237681668',
    projectId: 'flutterapps-f42c8',
    storageBucket: 'flutterapps-f42c8.appspot.com',
    androidClientId: '1057237681668-i38f40lnld9enaahi02br13olpiqq2gb.apps.googleusercontent.com',
    iosClientId: '1057237681668-47scetjg85b82pv0dm6o394j6mas33jq.apps.googleusercontent.com',
    iosBundleId: 'com.example.flexfit',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDhbAvTLQqsCQUf1ORqqXuqbFmU0aT-C7s',
    appId: '1:1057237681668:ios:de03cb5fcd42d9adb6d751',
    messagingSenderId: '1057237681668',
    projectId: 'flutterapps-f42c8',
    storageBucket: 'flutterapps-f42c8.appspot.com',
    androidClientId: '1057237681668-i38f40lnld9enaahi02br13olpiqq2gb.apps.googleusercontent.com',
    iosClientId: '1057237681668-ktrh4eo8a69blvb2nlbaqqmg4lo6ku6g.apps.googleusercontent.com',
    iosBundleId: 'com.example.flexfit.RunnerTests',
  );
}
