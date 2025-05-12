import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/personalization/screens/profile/profile.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

/// Controller to manage user-related functionality:
class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// init user data when home screen appears:
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// Fetch user record:
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // start loading:
      TFullScreenLoader.openLoadingDialog(
          'We are updating your information', TImages.docerAnimation);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader:
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation:
      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // update user's first & last name in the firebase fireStore:
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      // update the Rx User value:
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // remove loader:
      TFullScreenLoader.stopLoading();

      // show Success message:
      TLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your Name has been updated.');

      // Move to previous screen:
      Get.off(() => ProfileScreen());
    } catch (e) {
      // remove loader:
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
