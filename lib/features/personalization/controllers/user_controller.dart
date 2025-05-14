import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/features/personalization/models/user_model.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/re_authentication_user_login_form.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Fetch user record:
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Save user record from only registration provider:
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      // First Update Rx user and then check if user data is already stored. if not store new data:
      await fetchUserRecord();

      // if no record already stored:
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          // convert name to first and last name
          final nameParts =
              UserModel.namePorts(userCredential.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredential.user!.displayName ?? '');

          // Map Data:
          final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : ' ',
            username: username,
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '',
          );

          // Save user data:
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information. You can re-save your data in your profile');
    }
  }

  /// Delete Account Warning:
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: EdgeInsets.all(TSizes.md),
        title: 'Delete Account',
        middleText:
            'Are you sure want to delete your account permanently ? This action is not reversible and all of your data will be removed permanently.',
        confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: BorderSide(color: Colors.red),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
            child: Text("Delete"),
          ),
        ),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: Text("Cancel")));
  }

  /// Delete user Account:
  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.docerAnimation);

      /// first re-authenticate user:
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // re verify auth email:
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => LoginScreen());
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.to(() => ReAuthLoginForm());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: "Oh Snap", message: e.toString());
    }
  }

  /// -- Re-Authentication before deleting:
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.docerAnimation);

      // check internet:
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.registerWithEmailAndPassword(
          verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(() => LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: "Oh Snap", message: e.toString());
    }
  }

  /// Upload Profile image:
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;
        // Upload image:
        final imageUrl =
            await userRepository.uploadImage('Users/Images/Profile/', image);
        // Update user image record:
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        TLoaders.successSnackBar(
            title: 'Congratulations',
            message: 'Your Profile Image has been updated!');
      }
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'OhSnap', message: 'Something went wrong: $e');
    } finally {
      imageUploading.value = false;
    }
  }
}
