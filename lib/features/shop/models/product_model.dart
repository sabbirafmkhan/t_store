class ProductModel {
  final String id;
  final String title;
  final String thumbnail;
  final Brand? brand;
  final List<ProductVariation>? productVariations;

  ProductModel({
    required this.id,
    required this.title,
    required this.thumbnail,
    this.brand,
    this.productVariations,
  });
}

class Brand {
  final String name;

  Brand({required this.name});
}

class ProductVariation {
  final String id;
  final double price;
  final Map<String, String> attributeValues;

  ProductVariation({
    required this.id,
    required this.price,
    required this.attributeValues,
  });
}