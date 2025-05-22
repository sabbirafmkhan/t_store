import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/shop/controllers/product/cart_controller.dart';
import 'package:t_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:t_store/features/shop/screens/checkout/checkout.dart';
import 'package:t_store/navigation_manu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/loaders/animation_loader.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Obx(
        () {
          /// nothing found widget:
          final emptyWidget = TAnimationLoaderWidget(
            text: 'Whoops! Cart is EMPTY',
            animation: TImages.cartAnimation,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(() => NavigationManu()),
          );

          if (controller.cartItems.isEmpty) {
            return emptyWidget;
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),

                ///- Items in cart:
                child: TCartItems(),
              ),
            );
          }
        },
      ),

      /// -- Checkout button:
      bottomNavigationBar: controller.cartItems.isEmpty
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: ElevatedButton(
                onPressed: () => Get.to(() => CheckoutScreen()),
                child: Obx(() =>
                    Text("Checkout \$${controller.totalCartPrice.value}")),
              ),
            ),
    );
  }
}
