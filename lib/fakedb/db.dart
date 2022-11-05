import 'package:ecommerce/models/order.dart';
import 'package:uuid/uuid.dart';
import '../models/product.dart';
import '../models/push_notification.dart';

Uuid uuid = const Uuid();

class FakeDB {
  static List<Product> products = [
    Product(
        name: 'Menu Big Mc Classic',
        rating: 5,
        description: 'Gusta il classico Menu Big Mc assieme ai tuoi amici',
        id: uuid.v4(),
        price: 8.99,
        promotionalPrice: 6.49,
        isAvailable: true,
        availableQuantity: 0,
        category: 'panini',
        image: 'assets/images/hamburger.png'),
    Product(
        name: 'Crispy Mc Bacon',
        rating: 4.8,
        description: 'Gusta il famoso Crispy Mc Bacon con la tua famiglia',
        id: uuid.v4(),
        price: 3.99,
        isAvailable: true,
        promotionalPrice: 2.99,
        availableQuantity: 100,
        category: 'panini',
        image: 'assets/images/crispy.png'),
    Product(
        name: 'Coca Cola',
        rating: 4.3,
        description: 'La più bevuta in tutto il mondo. Gustala fresca',
        id: uuid.v4(),
        price: 1.99,
        isAvailable: true,
        availableQuantity: 100,
        category: 'bibite',
        image: 'assets/images/cocacola.png'),
    Product(
        rating: 2.4,
        name: 'Sprite',
        description: 'Frizzante e divertente. Assaporala con i tuoi amici',
        id: uuid.v4(),
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
        id: uuid.v4(),
        price: 2.49,
        isAvailable: true,
        availableQuantity: 100,
        category: 'altro',
        image: 'assets/images/fries.png'),
    Product(
        rating: 5,
        name: 'Happy Meal Menu',
        description: 'Perfetto per i tuoi bambini',
        id: uuid.v4(),
        price: 6.49,
        isAvailable: true,
        availableQuantity: 100,
        category: 'panini',
        image: 'assets/images/happy_meal.png'),
    Product(
        rating: 3.49,
        name: 'Bagel con Bacon',
        description: 'Perfetto per uno spuntino',
        id: uuid.v4(),
        price: 2.49,
        isAvailable: true,
        availableQuantity: 100,
        category: 'panini',
        image: 'assets/images/bacon_bagel.png'),
    Product(
        rating: 3.49,
        name: 'Toast con Prosciutto',
        description: 'Perfetto per uno spuntino',
        id: uuid.v4(),
        price: 2.49,
        isAvailable: true,
        availableQuantity: 100,
        category: 'panini',
        image: 'assets/images/toast.png'),
    Product(
        rating: 3.49,
        name: 'Mc chicken Panino',
        description: 'Perfetto per uno spuntino al pollo',
        id: uuid.v4(),
        price: 3.49,
        promotionalPrice: 2.99,
        isAvailable: true,
        availableQuantity: 100,
        category: 'panini',
        image: 'assets/images/mcchicken.png'),
    Product(
        rating: 4.99,
        name: 'Nuggets',
        description: 'Perfetto per uno spuntino al pollo',
        id: uuid.v4(),
        price: 2.49,
        isAvailable: true,
        availableQuantity: 100,
        category: 'altro',
        image: 'assets/images/nuggets.png'),
    Product(
        rating: 5.00,
        name: 'Bucket Pollo croccante',
        description: 'Perfetto per uno spuntino al pollo',
        id: uuid.v4(),
        price: 4.49,
        isAvailable: true,
        availableQuantity: 100,
        category: 'altro',
        image: 'assets/images/bucket.png'),
    Product(
        rating: 5.00,
        name: 'Rollerbox',
        description: 'Perfetto per uno spuntino.',
        id: uuid.v4(),
        price: 6.49,
        promotionalPrice: 4.99,
        isAvailable: true,
        availableQuantity: 100,
        category: 'panini',
        image: 'assets/images/roller_box.png'),
    Product(
        rating: 5.00,
        name: 'Black Burger',
        description: 'Perfetto per uno spuntino particolare.',
        id: uuid.v4(),
        price: 9.49,
        isAvailable: true,
        availableQuantity: 100,
        category: 'panini',
        image: 'assets/images/black_burger.png'),
    Product(
        rating: 5.00,
        name: 'Fanta Zero',
        description: 'Frizzante, rinfrescante e senza succheri.',
        id: uuid.v4(),
        price: 2.49,
        isAvailable: true,
        availableQuantity: 100,
        category: 'bibite',
        image: 'assets/images/fanta.png'),
  ];

  static List<Product> onSaleProducts =
      products.where((element) => element.promotionalPrice != null).toList();

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
      id: uuid.v4(),
      totalAmount: 50,
      vat: 10,
      products: [
        CartProduct(
            product: Product(
                rating: 4.99,
                name: 'Nuggets',
                description: 'Perfetto per uno spuntino al pollo',
                id: uuid.v4(),
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
