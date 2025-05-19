class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    required this.attributeValues,
  });

  // Create Empty func for clean code
  static ProductVariationModel empty() =>
      ProductVariationModel(id: '', attributeValues: {});

  ///  Json format:
  toJson() {
    return {
      'Id': id,
      'SKU': sku,
      'Image': image,
      'Description': description,
      'Price': price,
      'SalePrice': salePrice,
      'Stock': stock,
      'AttributeValues': attributeValues,
    };
  }

  // Map Json oriented document snapshot from Firebase to Model
  factory ProductVariationModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return ProductVariationModel.empty();
    return ProductVariationModel(
      id: data['Id'] ?? '',
      price: double.tryParse(data['Price']?.toString() ?? '') ?? 0.0,
      sku: data['SKU'] ?? '',
      stock: data['Stock'] ?? 0,
      salePrice: double.tryParse(data['SubPrice']?.toString() ?? '') ?? 0.0,
      image: data['Image'] ?? '',
      attributeValues: data['AttributeValues'] != null
          ? Map<String, String>.from(data['AttributeValues'])
          : <String, String>{},
      description: data['Description'] ?? '',
    );
  }
}
