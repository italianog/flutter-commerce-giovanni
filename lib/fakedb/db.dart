import 'package:ecommerce/models/order.dart';
import '../models/product.dart';
import '../models/push_notification.dart';

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
        id: 2,
        price: 3.99,
        isAvailable: true,
        availableQuantity: 100,
        category: 'panini',
        image: 'assets/images/crispy.png'),
    Product(
        name: 'Coca Cola',
        rating: 4.3,
        description: 'La più bevuta in tutto il mondo. Gustala fresca',
        id: 3,
        price: 1.99,
        isAvailable: true,
        availableQuantity: 100,
        category: 'bibite',
        image: 'assets/images/cocacola.png'),
    Product(
        rating: 2.4,
        name: 'Sprite',
        description: 'Frizzante e divertente. Assaporala con i tuoi amici',
        id: 4,
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
        id: 5,
        price: 2.49,
        isAvailable: true,
        availableQuantity: 100,
        category: 'altro',
        image: 'assets/images/fries.png'),
    Product(
        rating: 5,
        name: 'Happy Meal Menu',
        description: 'Perfetto per i tuoi bambini',
        id: 6,
        price: 6.49,
        isAvailable: true,
        availableQuantity: 100,
        category: 'panini',
        image: 'assets/images/happy_meal.png'),
    Product(
        rating: 3.49,
        name: 'Bagel con Bacon',
        description: 'Perfetto per uno spuntino',
        id: 7,
        price: 2.49,
        isAvailable: true,
        availableQuantity: 100,
        category: 'panini',
        image: 'assets/images/bacon_bagel.png'),
    Product(
        rating: 3.49,
        name: 'Toast con Prosciutto',
        description: 'Perfetto per uno spuntino',
        id: 8,
        price: 2.49,
        isAvailable: true,
        availableQuantity: 100,
        category: 'panini',
        image: 'assets/images/toast.png'),
    Product(
        rating: 3.49,
        name: 'Mc chicken Panino',
        description: 'Perfetto per uno spuntino al pollo',
        id: 9,
        price: 3.49,
        isAvailable: true,
        availableQuantity: 100,
        category: 'panini',
        image: 'assets/images/mcchicken.png'),
    Product(
        rating: 4.99,
        name: 'Nuggets',
        description: 'Perfetto per uno spuntino al pollo',
        id: 10,
        price: 2.49,
        isAvailable: true,
        availableQuantity: 100,
        category: 'altro',
        image: 'assets/images/nuggets.png'),
  ];

  static List<Product> onSaleProducts = const [
    Product(
        rating: 3.49,
        name: 'Toast con Prosciutto',
        description: 'Perfetto per uno spuntino',
        id: 8,
        price: 2.49,
        promotionalPrice: 1.99,
        isAvailable: true,
        availableQuantity: 100,
        category: 'panini',
        image: 'assets/images/toast.png'),
    Product(
        rating: 3.49,
        name: 'Mc chicken Panino',
        description: 'Perfetto per uno spuntino al pollo',
        id: 9,
        price: 3.49,
        promotionalPrice: 0.99,
        isAvailable: true,
        availableQuantity: 100,
        category: 'panini',
        image: 'assets/images/mcchicken.png'),
  ];

  static List<PushNotification> notifications = const [
    PushNotification(
        read: false,
        title: 'Benvenuto nel nuovo e-commerce',
        body:
            'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia',
        type: NotificationTypes.marketing),
    PushNotification(
        read: true,
        title: 'Ricordati di verificare la tua mail',
        body:
            'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia',
        type: NotificationTypes.other)
  ];

  static List<Order> orders = [
    Order(
      id: 1,
      totalAmount: 50,
      vat: 10,
      products: [
        const CartProduct(
            product: Product(
                rating: 4.99,
                name: 'Nuggets',
                description: 'Perfetto per uno spuntino al pollo',
                id: 10,
                price: 2.49,
                isAvailable: true,
                availableQuantity: 100,
                category: 'altro',
                image: 'assets/images/nuggets.png'),
            quantity: 2)
      ],
      status: 'In corso',
      createdAt: DateTime.now(),
    ),
  ];

  static List<Product> getProductsByCategory({
    required String category,
    String? nameFilter,
  }) {
    return products.where((element) => element.category == category).toList();
  }

  double getTotalFromOrder(Order order) {
    double sum = 0;
    for (var element in order.products) {
      sum += element.quantity * element.product.price;
    }
    return sum;
  }
}
