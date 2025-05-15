import 'package:t_store/features/shop/models/cart_model.dart';

class OrderModel {
  final String id;
  final OrderStatus status;
  final List<CartItemsModel> items;
  final double totalAmount;
  final DateTime orderDate;
  final DateTime deliveryDate;

  OrderModel({
    required this.id,
    required this.status,
    required this.items,
    required this.totalAmount,
    required this.orderDate,
    required this.deliveryDate,
  });
}

enum OrderStatus {
  pending,
  processing,
  shipped,
  delivered,
  cancelled,
}
