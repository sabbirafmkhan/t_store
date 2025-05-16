import 'package:get/get.dart';
import 'package:t_store/features/shop/models/product_model.dart';

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
  }

  /// -- Show Image Popup:
  void showEnlargedImage(String image) {}
}
