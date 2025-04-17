import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/styles/spacing_styles.dart';
import 'package:t_store/common/widgets/form_divider.dart';
import 'package:t_store/common/widgets/social_buttons.dart';
import 'package:t_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:t_store/features/authentication/screens/login/widgets/login_header.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, title $ subtitle:
              TLoginHeader(),

              /// Form:
              TLoginForm(),

              /// Divider
              TFormDivider(
                dividerText: TTexts.orSignInWith.capitalize!,
              ),
              SizedBox(height: TSizes.spaceBtwSections),

              /// Footer
              TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
