import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/products/cart/add_remove_button.dart';
import 'package:t_store/common/widgets/products/cart/cart_item.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/features/shop/controllers/product/cart_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        itemCount: cartController.cartItems.length,
        separatorBuilder: (_, __) => SizedBox(height: TSizes.spaceBtwSections),
        itemBuilder: (_, index) => Obx(
          () {
            final item = cartController.cartItems[index];
            return Column(
              children: [
                /// - Cart item:
                TCartItem(
                  cartItem: item,
                ),
                if (showAddRemoveButtons)
                  const SizedBox(height: TSizes.spaceBtwItems),

                /// add remove button row with total price:
                if (showAddRemoveButtons)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          /// Extra space:
                          const SizedBox(width: 70),

                          /// add remove button:
                          TProductQuantityWithAddRemoveButton(
                            quantity: item.quantity,
                            add: () => cartController.addOneToCart(item),
                            remove: () =>
                                cartController.removeOneFromCart(item),
                          ),
                        ],
                      ),

                      /// -- Product total price:
                      TProductPriceText(
                        price: (item.price * item.quantity).toStringAsFixed(1),
                      ),
                    ],
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
