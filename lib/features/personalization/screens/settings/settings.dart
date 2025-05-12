import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:t_store/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/personalization/screens/address/address.dart';
import 'package:t_store/features/personalization/screens/profile/profile.dart';
import 'package:t_store/features/shop/screens/cart/cart.dart';
import 'package:t_store/features/shop/screens/order/widgets/order.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  final AuthenticationRepository authRepo = AuthenticationRepository();

  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// --header:
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  // Appbar
                  TAppBar(
                      title: Text("Accounts",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .apply(color: TColors.white))),

                  /// --User profile card:
                  TUserProfileTile(
                      onPressed: () => Get.to(() => ProfileScreen())),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            /// --body:
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Account Settings:
                  TSectionHeading(
                      title: 'Account Settings', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Address',
                    subtitle: 'Set shopping delivery address',
                    onTap: () => Get.to(() => UserAddressScreen()),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subtitle: 'Add, remove products and move to checkout',
                    onTap: () => Get.to(() => CartScreen()),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subtitle: 'In-progress and Completed Orders',
                    onTap: () => Get.to(() => OrderScreen()),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.bank,
                    title: 'Bank Account',
                    subtitle: 'Withdraw balance to registered bank account',
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subtitle: 'List of all the discounted coupons',
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notification',
                    subtitle: 'Set any kind of notification message',
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subtitle: 'Manage data usage and connected accounts',
                  ),

                  /// -- App Settings:
                  SizedBox(height: TSizes.spaceBtwSections),
                  TSectionHeading(
                      title: 'App Settings', showActionButton: false),
                  SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'Load Data',
                      subtitle: 'Upload Data to your Cloud Firebase'),
                  TSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subtitle: 'Set Recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subtitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subtitle: 'Set Image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),

                  /// -- Logout Button:
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () async {
                        try {
                          await authRepo.logout(); // Call the logout function
                        } catch (e) {
                          // Handle logout error
                          Get.snackbar('Error', e.toString(),
                              snackPosition: SnackPosition.BOTTOM);
                        }
                      },
                      child: const Text('Logout'),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections * 2.5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
