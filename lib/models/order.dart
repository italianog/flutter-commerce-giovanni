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

  factory Order.fromMap(Map<String, dynamic> map) {
    List<CartProduct> cartProducts = [];
    for (var element in map['products']) {
      final variable = CartProduct.fromMap(element);
      cartProducts.add(variable);
    }

    return Order(
      id: map['id'],
      totalAmount: map['totalAmount'],
      vat: map['vat'],
      products: cartProducts,
      coupon: map['coupon'],
      status: map['status'],
      createdAt: map['createdAt'].toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'totalAmount': totalAmount,
      'vat': vat,
      'products': [...products.map((e) => e.toMap())],
      'coupon': coupon,
      'status': status,
      'createdAt': createdAt,
    };
  }
}
