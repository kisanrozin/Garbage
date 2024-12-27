// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyD_YLUAlTlUeboawEmsau8sy4qHr3xOKkY',
    appId: '1:59972183368:web:c1ff4214e4d7b0a0577f7d',
    messagingSenderId: '59972183368',
    projectId: 'buangin-31aa9',
    authDomain: 'buangin-31aa9.firebaseapp.com',
    storageBucket: 'buangin-31aa9.firebasestorage.app',
    measurementId: 'G-N74G6YJMJG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAvPzfCkbZeeON9ujU7CEZerXOxzC8mm7U',
    appId: '1:59972183368:android:4ab8c12640f49bd8577f7d',
    messagingSenderId: '59972183368',
    projectId: 'buangin-31aa9',
    storageBucket: 'buangin-31aa9.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCJXcAJWLqqzZ_BZIA4vCeUqjXdNnwHN00',
    appId: '1:59972183368:ios:27266c5f6b93d5c8577f7d',
    messagingSenderId: '59972183368',
    projectId: 'buangin-31aa9',
    storageBucket: 'buangin-31aa9.firebasestorage.app',
    iosBundleId: 'com.example.responsi1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCJXcAJWLqqzZ_BZIA4vCeUqjXdNnwHN00',
    appId: '1:59972183368:ios:27266c5f6b93d5c8577f7d',
    messagingSenderId: '59972183368',
    projectId: 'buangin-31aa9',
    storageBucket: 'buangin-31aa9.firebasestorage.app',
    iosBundleId: 'com.example.responsi1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD_YLUAlTlUeboawEmsau8sy4qHr3xOKkY',
    appId: '1:59972183368:web:bd329572145300bd577f7d',
    messagingSenderId: '59972183368',
    projectId: 'buangin-31aa9',
    authDomain: 'buangin-31aa9.firebaseapp.com',
    storageBucket: 'buangin-31aa9.firebasestorage.app',
    measurementId: 'G-79YXR9YN9M',
  );
}
