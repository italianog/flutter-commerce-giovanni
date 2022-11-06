class Product {
  final String name;
  final String id;
  final double price;
  final double? promotionalPrice;
  final bool isAvailable;
  final int availableQuantity;
  final String? category;
  final String? description;
  final String image;
  final double rating;

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
    required this.rating,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        name: map['name'] ?? map['title'],
        id: map['id'],
        price: map['price'] * 1.00,
        isAvailable: map['isAvailable'] ?? true,
        promotionalPrice: map['promotionalPrice'] != null
            ? double.tryParse(map['promotionalPrice'])
            : null,
        image: map['image'],
        availableQuantity: 10,
        rating: map['rating'] ?? 5.0,
        description: map['description']);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'price': price,
      'promotionalPrice': promotionalPrice,
      'isAvailable': isAvailable,
      'image': image,
      'availableQuantity': availableQuantity,
      'rating': rating,
      'description': description,
    };
  }
}

class CartProduct {
  final Product product;
  final int quantity;

  const CartProduct({
    required this.product,
    required this.quantity,
  });

  factory CartProduct.fromMap(Map<String, dynamic> map) {
    return CartProduct(
      product: Product(
        name: map['product']['name'],
        id: map['product']['id'],
        price: map['product']['price'] * 1.00,
        isAvailable: map['product']['isAvailable'] ?? true,
        image: map['product']['image'],
        promotionalPrice: map['product']['promotionalPrice'],
        availableQuantity: 10,
        rating: map['product']['rating'] ?? 5.0,
        description: map['product']['description'],
      ),
      quantity: map['quantity'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'product': product.toMap(),
      'quantity': quantity,
    };
  }

  CartProduct copyWith({
    Product? product,
    int? quantity,
  }) {
    return CartProduct(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }
}
