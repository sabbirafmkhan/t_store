class CartModel {
  final String cartId;
  final List<CartItemsModel> items;

  CartModel({
    required this.cartId,
    required this.items,
  });
}

class CartItemsModel {
  final String productId;
  final String variationId;
  final int quantity;
  final String title;
  final String image;
  final String brandName;
  final double price;
  final Map<String, String> selectedVariation;

  CartItemsModel({
    required this.productId,
    required this.variationId,
    required this.quantity,
    required this.title,
    required this.image,
    required this.brandName,
    required this.price,
    required this.selectedVariation,
  });
}