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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBD0zJi_noX-7dHbZnmz9fd4BlCBjRi1t8',
    appId: '1:110040364958:web:ecfe7495c6187f4574c88f',
    messagingSenderId: '110040364958',
    projectId: 'ap-assignment-9ca26',
    authDomain: 'ap-assignment-9ca26.firebaseapp.com',
    storageBucket: 'ap-assignment-9ca26.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBmBqiMEvdTmF426H4tdiYOw7nLZ_Kqqho',
    appId: '1:110040364958:android:89ec0f163436779574c88f',
    messagingSenderId: '110040364958',
    projectId: 'ap-assignment-9ca26',
    storageBucket: 'ap-assignment-9ca26.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBCxLxrWesg49IXShhKGllEu7r_4D6boIE',
    appId: '1:110040364958:ios:0a46a716f2b5ed6574c88f',
    messagingSenderId: '110040364958',
    projectId: 'ap-assignment-9ca26',
    storageBucket: 'ap-assignment-9ca26.appspot.com',
    iosBundleId: 'com.example.apAssignment',
  );
}
