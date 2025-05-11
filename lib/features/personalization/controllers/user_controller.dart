import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/personalization/models/user_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  /// Save user record from only registration provider:
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        // convert name to first and last name
        final nameParts =
            UserModel.namePorts(userCredential.user!.displayName ?? '');
        final username =
            UserModel.generateUsername(userCredential.user!.displayName ?? '');

        // Map Data:
        final user = UserModel(
          id: userCredential.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : ' ',
          username: username,
          email: userCredential.user!.email ?? '',
          phoneNumber: userCredential.user!.phoneNumber ?? '',
          profilePicture: userCredential.user!.photoURL ?? '',
        );

        // Save user data:
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information. You can re-save your data in your profile');
    }
  }
}
