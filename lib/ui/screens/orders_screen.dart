import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/models/order.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/ui/screens/order_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class OrdersScreen extends ConsumerStatefulWidget {
  const OrdersScreen({
    Key? key,
  }) : super(key: key);

  static const routeName = '/orders-screen';

  @override
  ConsumerState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends ConsumerState<OrdersScreen> {
  DateFormat dateFormat = DateFormat("yyyy/MM/dd HH:mm");

  final List<Order> _orders = [
    Order(
        id: 1,
        createdAt: DateTime.now(),
        totalAmount: 100,
        vat: 10,
        products: [
          const CartProduct(
              product: Product(
                  rating: 3,
                  name: 'Prova',
                  price: 100,
                  id: 1,
                  availableQuantity: 10,
                  image:
                      'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
                  isAvailable: true),
              quantity: 1)
        ],
        status: 'Shipped')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ordini'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => ListTile(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            OrderDetailScreen.routeName,
                            arguments: _orders[index]);
                      },
                      contentPadding: const EdgeInsets.all(8.0),
                      tileColor: Colors.white,
                      leading: SizedBox(
                        height: 100,
                        width: 100,
                        child: CachedNetworkImage(
                          imageUrl: _orders[index].products[0].product.image,
                        ),
                      ),
                      title: Text(
                        dateFormat.format(_orders[index].createdAt),
                      ),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                separatorBuilder: (context, index) => const SizedBox(),
                itemCount: _orders.length),
          ],
        ),
      ),
    );
  }
}
