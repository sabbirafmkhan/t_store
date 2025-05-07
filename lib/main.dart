import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/app.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';

import 'firebase_options.dart';

/// ------ Entry point of flutter App -------

Future<void> main() async {
  /// -- widgets binding:
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  /// -- Get-x local storage:
  await GetStorage.init();

  /// -- await splash until other items load:
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// -- Initialize firebase & authentication repository:
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  /// -- Load all the material design / themes / localizations / bindings:
  runApp(const App());
}
