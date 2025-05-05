import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/brands/brand_card.dart';
import 'package:t_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:t_store/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text("Nike"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Details:
              TBrandCard(showBorder: true),
              const SizedBox(height: TSizes.spaceBtwSections),

              TSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
