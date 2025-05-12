import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables:
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password Email:
  sendPasswordResetEmail() async {
    try {
      // start loading:
      TFullScreenLoader.openLoadingDialog(
          'Processing your request...', TImages.docerAnimation);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader:
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation:
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // send email to reset password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Remove loader:
      TFullScreenLoader.stopLoading();

      // show Success Screen:
      TLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link sent to reset your password'.tr);

      // Redirect;
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      // Remove loader:
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // start loading:
      TFullScreenLoader.openLoadingDialog(
          'Processing your request...', TImages.docerAnimation);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader:
        TFullScreenLoader.stopLoading();
        return;
      }

      // send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove loader:
      TFullScreenLoader.stopLoading();

      // show Success Screen:
      TLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link sent to reset your password'.tr);
    } catch (e) {
      // Remove loader:
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
