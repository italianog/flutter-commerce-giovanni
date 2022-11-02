import '../models/product.dart';

class FakeDB {
  static List<Product> products = const [
    Product(
        name: 'Menu Big Mc Classic',
        id: 1,
        price: 8.99,
        isAvailable: true,
        availableQuantity: 100,
        category: 'panini',
        image: 'assets/images/hamburger.png'),
    Product(
        name: 'Crispy Mc Bacon',
        id: 3,
        price: 3.99,
        isAvailable: true,
        availableQuantity: 100,
        category: 'panini',
        image: 'assets/images/crispy.png'),
    Product(
        name: 'Coca Cola',
        id: 2,
        price: 1.99,
        isAvailable: true,
        availableQuantity: 100,
        category: 'bibite',
        image: 'assets/images/cocacola.png'),
    Product(
        name: 'Sprite',
        id: 2,
        price: 1.99,
        isAvailable: true,
        availableQuantity: 100,
        category: 'bibite',
        image: 'assets/images/sprite.png'),
  ];

  static List<Product> getPanini() {
    return products.where((element) => element.category == 'panini').toList();
  }

  static List<Product> getBibite() {
    return products.where((element) => element.category == 'bibite').toList();
  }
}
