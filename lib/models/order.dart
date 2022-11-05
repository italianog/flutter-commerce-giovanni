import 'package:ecommerce/models/product.dart';

class Order {
  String id;
  double totalAmount;
  double vat;
  List<CartProduct> products;
  String? coupon;
  String status;
  DateTime createdAt;

  Order({
    required this.id,
    required this.totalAmount,
    required this.vat,
    required this.products,
    this.coupon,
    required this.status,
    required this.createdAt,
  });
}
