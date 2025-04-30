import 'package:flutter/material.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_details_image_slider.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Product image slider:
            TProductImageSlider(),

            /// -- product details:
          ],
        ),
      ),
    );
  }
}
