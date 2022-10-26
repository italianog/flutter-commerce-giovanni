class Product {
  final String name;
  final int id;
  final double price;
  final double? promotionalPrice;
  final bool isAvailable;
  final int availableQuantity;
  final String? category;
  final String image;

  const Product({
    required this.name,
    required this.id,
    required this.price,
    this.promotionalPrice,
    required this.isAvailable,
    required this.availableQuantity,
    this.category,
    required this.image,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        name: map['title'],
        id: map['id'],
        price: map['price'] * 1.00,
        isAvailable: true,
        image: map['image'],
        availableQuantity: 10);
  }
}
