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
    apiKey: 'AIzaSyBFIngajp3_dPnUwOX6IDI3k1bJwcw9Mug',
    appId: '1:1018061691120:web:e320a7cb98e1197f340a35',
    messagingSenderId: '1018061691120',
    projectId: 'notesbloc-be0d2',
    authDomain: 'notesbloc-be0d2.firebaseapp.com',
    storageBucket: 'notesbloc-be0d2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAuxa6FpjSCJxC4VrzImExASd12Q_iyOwc',
    appId: '1:1018061691120:android:13de94b0fce642e1340a35',
    messagingSenderId: '1018061691120',
    projectId: 'notesbloc-be0d2',
    storageBucket: 'notesbloc-be0d2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBOn3_80Jt2HDx5T5GZptu35b5yKMSh184',
    appId: '1:1018061691120:ios:752bb0a30e0094dc340a35',
    messagingSenderId: '1018061691120',
    projectId: 'notesbloc-be0d2',
    storageBucket: 'notesbloc-be0d2.appspot.com',
    iosClientId: '1018061691120-cjr24lj1regdfh3tplf2urlu8iinujch.apps.googleusercontent.com',
    iosBundleId: 'com.example.notesBloc',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBOn3_80Jt2HDx5T5GZptu35b5yKMSh184',
    appId: '1:1018061691120:ios:752bb0a30e0094dc340a35',
    messagingSenderId: '1018061691120',
    projectId: 'notesbloc-be0d2',
    storageBucket: 'notesbloc-be0d2.appspot.com',
    iosClientId: '1018061691120-cjr24lj1regdfh3tplf2urlu8iinujch.apps.googleusercontent.com',
    iosBundleId: 'com.example.notesBloc',
  );
}
