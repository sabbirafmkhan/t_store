import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/features/shop/controllers/product/order_controller.dart';
import 'package:t_store/navigation_manu.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/utils/loaders/animation_loader.dart';

class TOrdersListItems extends StatelessWidget {
  const TOrdersListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    final dark = THelperFunctions.isDarkMode(context);
    return FutureBuilder(
      future: controller.fetchUserOrders(),
      builder: (_, snapshot) {
        /// Nothing found widget:
        final emptyWidget = TAnimationLoaderWidget(
          text: 'Whoops! No Order Yet!',
          animation: TImages.orderCompletedAnimation,
          showAction: true,
          actionText: 'Let\'s fill it',
          onActionPressed: () => Get.off(() => NavigationManu()),
        );

        /// Helper Function: Handle loader , NO record, or Error massage:
        final response = TCloudHelperFunctions.checkMultiRecordState(
            snapshot: snapshot, nothingFound: emptyWidget);
        if (response != null) return response;

        /// Congratulation Record found:
        final orders = snapshot.data!;
        return ListView.separated(
          shrinkWrap: true,
          itemCount: orders.length,
          separatorBuilder: (_, index) =>
              const SizedBox(height: TSizes.spaceBtwItems),
          itemBuilder: (_, index) {
            final order = orders[index];
            return TRoundedContainer(
              showBorder: true,
              padding: EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// --  Row-1:
                  Row(
                    children: [
                      /// 1-- Icon:
                      Icon(Iconsax.ship),
                      const SizedBox(width: TSizes.spaceBtwItems / 2),

                      /// 2-- Status & date:
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order.orderStatusText,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .apply(
                                      color: TColors.primary,
                                      fontWeightDelta: 1),
                            ),
                            Text(
                              order.formattedOrderDate,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ),

                      /// 3 -- Icon:
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Iconsax.arrow_right_34,
                          size: TSizes.iconSm,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// --  Row-2:
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            /// 1-- Icon:
                            Icon(Iconsax.tag),
                            const SizedBox(width: TSizes.spaceBtwItems / 2),

                            /// 2-- Status & date:
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Order",
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                  Text(
                                    order.id,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            /// 1-- Icon:
                            Icon(Iconsax.calendar),
                            const SizedBox(width: TSizes.spaceBtwItems / 2),

                            /// 2-- Status & date:
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Shipping Date",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                  Text(
                                    order.formattedDeliveryDate,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
