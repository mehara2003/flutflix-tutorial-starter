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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDYi3FAIUjdJliR-NSkDEBIdp7lT1VcsXI',
    appId: '1:243402503301:android:9b4b906d48282fe3c765ec',
    messagingSenderId: '243402503301',
    projectId: 'movieflixer-94c74',
    authDomain: 'flutterfire-ui-codelab.firebaseapp.com',
    storageBucket: 'flutterfire-ui-codelab.appspot.com',
    measurementId: 'G-DGF0CP099H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDYi3FAIUjdJliR-NSkDEBIdp7lT1VcsXI',
    appId: '1:243402503301:android:9b4b906d48282fe3c765ec',
    messagingSenderId: '243402503301',
    projectId: 'movieflixer-94c74',
    storageBucket: 'flutterfire-ui-codelab.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDYi3FAIUjdJliR-NSkDEBIdp7lT1VcsXI',
    appId: '1:243402503301:android:9b4b906d48282fe3c765ec',
    messagingSenderId: '243402503301',
    projectId: 'movieflixer-94c74',
    storageBucket: 'flutterfire-ui-codelab.appspot.com',
    iosClientId: '963656261848-v7r3vq1v6haupv0l1mdrmsf56ktnua60.apps.googleusercontent.com',
    iosBundleId: 'com.example.complete',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDYi3FAIUjdJliR-NSkDEBIdp7lT1VcsXI',
    appId: '1:243402503301:android:9b4b906d48282fe3c765ec',
    messagingSenderId: '243402503301',
    projectId: 'movieflixer-94c74',
    storageBucket: 'flutterfire-ui-codelab.appspot.com',
    iosClientId: '963656261848-v7r3vq1v6haupv0l1mdrmsf56ktnua60.apps.googleusercontent.com',
    iosBundleId: 'com.example.complete',
  );
}