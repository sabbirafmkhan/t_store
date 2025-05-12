import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(title: Text('Re-Authenticate User')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
              key: controller.reAuthFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Email:
                  TextFormField(
                    controller: controller.verifyEmail,
                    validator: TValidator.validateEmail,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.direct_right),
                        labelText: TTexts.email),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),

                  /// Password:
                  Obx(
                    () => TextFormField(
                      obscureText: controller.hidePassword.value,
                      controller: controller.verifyPassword,
                      validator: (value) =>
                          TValidator.validateEmptyText('Password', value),
                      decoration: InputDecoration(
                        labelText: TTexts.password,
                        prefixIcon: Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value =
                              !controller.hidePassword.value,
                          icon: Icon(Iconsax.eye_slash),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Login Button:
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () =>
                            controller.reAuthenticateEmailAndPasswordUser(),
                        child: Text("Verify")),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
