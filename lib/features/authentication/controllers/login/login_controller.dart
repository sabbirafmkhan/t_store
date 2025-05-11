import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class LoginController extends GetxController {
  /// variables:
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read("REMEMBER_ME_EMAIL") ?? "";
    password.text = localStorage.read("REMEMBER_ME_PASSWORD") ?? "";
    super.onInit();
  }

  /// -- Email and Password SignIn:
  Future<void> emailAndPasswordSignIn() async {
    try {
      // - start Loading:
      TFullScreenLoader.openLoadingDialog(
          'Logging you in...', TImages.docerAnimation);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader:
        TFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!loginFormKey.currentState!.validate()) {
        // Remove Loader:
        TFullScreenLoader.stopLoading();
        return;
      }

      // save data if remember me is selected:
      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      // Login user using Email and Password Authentication:
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // remove loader :
      TFullScreenLoader.stopLoading();

      // Redirect:
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  ///-- Google SignIn Authentication:
  Future<void> googleSignIn() async {
    try {
      // - start Loading:
      TFullScreenLoader.openLoadingDialog(
          'Logging you in...', TImages.docerAnimation);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader:
        TFullScreenLoader.stopLoading();
        return;
      }

      // -- Google Authentication:
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      // Save user record:
      await userController.saveUserRecord(userCredentials);

      // Remove Loader:
      TFullScreenLoader.stopLoading();

      // Redirect:
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove Loader:
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
