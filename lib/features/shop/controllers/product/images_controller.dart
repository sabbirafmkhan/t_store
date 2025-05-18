import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  /// variables:
  RxString selectedProductImage = ''.obs;

  /// -- Get All Image from product and variables:
  List<String> getAllProductImage(ProductModel product) {
    // us set to add unique images only:
    Set<String> images = {};

    // Load thumbnail image:
    images.add(product.thumbnail);

    // Assign Thumbnail as selected image:
    selectedProductImage.value = product.thumbnail;

    // Get all images from the product model if not null:
    if (product.images != null) {
      images.addAll(product.images!);
    }

    // Get all images from  the product variations if not null:
    if (product.productVariations != null &&
        product.productVariations!.isNotEmpty) {
      images.addAll(
          product.productVariations!.map((variation) => variation.image));
    }

    return images.toList();
  }

  /// -- Show Image Popup:
  void showEnlargedImage(String image) {
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: TSizes.defaultSpace * 2,
                  horizontal: TSizes.defaultSpace),
              child: CachedNetworkImage(imageUrl: image),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(
                  onPressed: () => Get.back(),
                  child: Text('Close'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
