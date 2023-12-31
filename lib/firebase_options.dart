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
    apiKey: 'AIzaSyDTRcNx-SsnSjwnZXAbQ84nTMtx_6nvakI',
    appId: '1:1060488208962:web:e6d06251ac491b7c9343db',
    messagingSenderId: '1060488208962',
    projectId: 'fir-workshop-6e921',
    authDomain: 'fir-workshop-6e921.firebaseapp.com',
    storageBucket: 'fir-workshop-6e921.appspot.com',
    measurementId: 'G-CZ0DN8HRV1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBfteEzdk0KBSgGJXEHMS-Pk6vY1CK2psk',
    appId: '1:1060488208962:android:143403fc2fbba5b89343db',
    messagingSenderId: '1060488208962',
    projectId: 'fir-workshop-6e921',
    storageBucket: 'fir-workshop-6e921.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCHvubvnPCwrjvh0FeZnX6-hjMLpfSRCA0',
    appId: '1:1060488208962:ios:5723a6e4ebec301a9343db',
    messagingSenderId: '1060488208962',
    projectId: 'fir-workshop-6e921',
    storageBucket: 'fir-workshop-6e921.appspot.com',
    iosBundleId: 'com.example.jot',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCHvubvnPCwrjvh0FeZnX6-hjMLpfSRCA0',
    appId: '1:1060488208962:ios:cbb99c05823e3db19343db',
    messagingSenderId: '1060488208962',
    projectId: 'fir-workshop-6e921',
    storageBucket: 'fir-workshop-6e921.appspot.com',
    iosBundleId: 'com.example.jot.RunnerTests',
  );
}
