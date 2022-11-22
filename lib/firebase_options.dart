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
    apiKey: 'AIzaSyCgpTEXXNhq_v8ed6ucamnxPi_8R8XX0E4',
    appId: '1:933003367454:web:30e53386d4312c97118a0f',
    messagingSenderId: '933003367454',
    projectId: 'asroo-shop-getx-ad001',
    authDomain: 'asroo-shop-getx-ad001.firebaseapp.com',
    storageBucket: 'asroo-shop-getx-ad001.appspot.com',
    measurementId: 'G-77P4R4B54V',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB8Da-wRpDycKkAu7XMqEvzjpnRVwnNLMk',
    appId: '1:933003367454:android:13f9179afa2a4260118a0f',
    messagingSenderId: '933003367454',
    projectId: 'asroo-shop-getx-ad001',
    storageBucket: 'asroo-shop-getx-ad001.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAcexiBEEzwUUTVXC9JtfhKQpDs0HirQ9I',
    appId: '1:933003367454:ios:35b17490bd79951e118a0f',
    messagingSenderId: '933003367454',
    projectId: 'asroo-shop-getx-ad001',
    storageBucket: 'asroo-shop-getx-ad001.appspot.com',
    androidClientId: '933003367454-gp9i8d982h5vgm6s1qrui2avmvo3mufs.apps.googleusercontent.com',
    iosClientId: '933003367454-kdeu4ed0skftbo9f9f3v8g0grcd25d3i.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAcexiBEEzwUUTVXC9JtfhKQpDs0HirQ9I',
    appId: '1:933003367454:ios:35b17490bd79951e118a0f',
    messagingSenderId: '933003367454',
    projectId: 'asroo-shop-getx-ad001',
    storageBucket: 'asroo-shop-getx-ad001.appspot.com',
    androidClientId: '933003367454-gp9i8d982h5vgm6s1qrui2avmvo3mufs.apps.googleusercontent.com',
    iosClientId: '933003367454-kdeu4ed0skftbo9f9f3v8g0grcd25d3i.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );
}