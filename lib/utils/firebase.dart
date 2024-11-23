import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }


  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD8LTlCS4ck7alIn6dDpgmJWmiO5U86Aio',
    appId: "1:678375027840:android:57465edc1cf54c12ce2265",
    messagingSenderId: '678375027840',
    projectId: 'beautik-6c718',
    storageBucket: 'beautik-6c718.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDePZxDjIYPzhByTdWNhyo-ynLfsGyPdMM',
    appId: '1:678375027840:ios:fd77d318bfc45997ce2265',
    messagingSenderId: '678375027840',
    projectId: 'beautik-6c718',
    storageBucket: 'beautik-6c718.appspot.com',
  );

}