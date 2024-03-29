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
    apiKey: 'AIzaSyC8qMGBPI5NXT4kXCb5TFt1gjNxtYKDv3A',
    appId: '1:656350468641:web:d00d84448d9847fe476160',
    messagingSenderId: '656350468641',
    projectId: 'mono-e4a22',
    authDomain: 'mono-e4a22.firebaseapp.com',
    storageBucket: 'mono-e4a22.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCtYJVMue-xx5rF7FmICBdb5UfA92sOHQE',
    appId: '1:656350468641:android:c0b09950722e7cb0476160',
    messagingSenderId: '656350468641',
    projectId: 'mono-e4a22',
    storageBucket: 'mono-e4a22.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDrDQuft7czdlTosgQjx4zlKDKTD9UrEyo',
    appId: '1:656350468641:ios:efdcdd12b9617602476160',
    messagingSenderId: '656350468641',
    projectId: 'mono-e4a22',
    storageBucket: 'mono-e4a22.appspot.com',
    iosBundleId: 'com.example.mono',
  );
}
