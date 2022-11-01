class Product {
  final String name;
  final int? id;
  final double price;
  final double? promotionalPrice;
  final bool isAvailable;
  final int availableQuantity;
  final String? category;
  final String? description;
  final String image;

  const Product({
    required this.name,
    required this.id,
    required this.price,
    this.promotionalPrice,
    required this.isAvailable,
    required this.availableQuantity,
    this.category,
    this.description,
    required this.image,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        name: map['name'] ?? map['title'],
        id: map['id'],
        price: map['price'] * 1.00,
        isAvailable: map['isAvailable'] ?? true,
        image: map['image'],
        availableQuantity: 10,
        description: map['description']);
  }
}

class CartProduct {
  final Product product;
  final int quantity;
  final String? size;
  final String? color;

  const CartProduct({
    required this.product,
    required this.quantity,
    this.size,
    this.color,
  });
}
