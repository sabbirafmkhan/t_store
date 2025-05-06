import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/app.dart';

import 'firebase_options.dart';

/// ------ Entry point of flutter App -------

Future<void> main() async {
  // Todo: Add widgets binding.
  // Todo: init local storage.
  // Todo: Await native splash.
  // Todo: init firebase.
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );
  // Todo: init authentication.

  runApp(const App());
}
