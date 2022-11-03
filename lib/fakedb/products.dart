import '../models/product.dart';

enum Bibite { cocacola, sprite }

class FakeDB {
  static List<Product> products = const [
    Product(
        name: 'Menu Big Mc Classic',
        rating: 5,
        description: 'Gusta il classico Menu Big Mc assieme ai tuoi amici',
        id: 1,
        price: 8.99,
        isAvailable: true,
        availableQuantity: 100,
        category: 'panini',
        image: 'assets/images/hamburger.png'),
    Product(
        name: 'Crispy Mc Bacon',
        rating: 4.8,
        description: 'Gusta il famoso Crispy Mc Bacon con la tua famiglia',
        id: 3,
        price: 3.99,
        isAvailable: true,
        availableQuantity: 100,
        category: 'panini',
        image: 'assets/images/crispy.png'),
    Product(
        name: 'Coca Cola',
        rating: 4.3,
        description: 'La più bevuta in tutto il mondo. Gustala fresca',
        id: 2,
        price: 1.99,
        isAvailable: true,
        availableQuantity: 100,
        category: 'bibite',
        image: 'assets/images/cocacola.png'),
    Product(
        rating: 2.4,
        name: 'Sprite',
        description: 'Frizzante e divertente. Assaporala con i tuoi amici',
        id: 2,
        price: 1.99,
        isAvailable: true,
        availableQuantity: 100,
        category: 'bibite',
        image: 'assets/images/sprite.png'),
    Product(
        rating: 5,
        name: 'Patatine Fritte',
        description:
            'Talmente buone che ti consigliamo di ordinare la porzione XXL',
        id: 10,
        price: 2.49,
        isAvailable: true,
        availableQuantity: 100,
        category: 'altro',
        image: 'assets/images/fries.png'),
  ];

  static List<Product> getProductsByCategory(String category) {
    return products.where((element) => element.category == category).toList();
  }
}
