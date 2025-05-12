import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/products/cart/coupon_widget.dart';
import 'package:t_store/common/widgets/success_screen/success_screen.dart';
import 'package:t_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:t_store/navigation_manu.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Checkout',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- items in cart:
              TCartItems(showAddRemoveButtons: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// -- Coupon TextField:
              TCouponCode(),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// -- Billing Section:
              TRoundedContainer(
                showBorder: true,
                padding: EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: Column(
                  children: [
                    /// Pricing:
                    TBillingAmountSection(),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    /// Divider:
                    const Divider(),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    /// payment methods:
                    TBillingPaymentSection(),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    /// address:
                    TBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      /// -- Checkout button:
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(
                  () => SuccessScreen(
                    image: TImages.paymentSuccessfulAnimation,
                    title: 'Payment Success',
                    subtitle: 'Your item will be shipped soon!',
                    onPressed: () => Get.offAll(() => NavigationManu()),
                  ),
                ),
            child: Text("Checkout \$256")),
      ),
    );
  }
}
