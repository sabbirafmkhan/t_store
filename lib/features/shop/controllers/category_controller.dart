import 'package:get/get.dart';
import 'package:t_store/data/repositories/categories/categories_repository.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// -- Load category data:
  Future<void> fetchCategories() async {
    try {
      // show loader while loading categories:
      isLoading.value = true;

      // Fetch categories from data source (firebase, API, etc):
      final categories = await _categoryRepository.getAllCategories();

      // Update the categories list:
      allCategories.assignAll(categories);

      // Filter featured categories:
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }

  /// -- Load selected category data:

  /// Get category or sub-category Products:
}
