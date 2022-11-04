import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/fakedb/db.dart';
import 'package:ecommerce/models/order.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/ui/screens/order_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../widgets/order_tile.dart';

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
  final List<Order> _orders = FakeDB.orders;

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
                itemBuilder: (context, index) =>
                    OrderTile(order: _orders[index]),
                separatorBuilder: (context, index) => const SizedBox(),
                itemCount: _orders.length),
          ],
        ),
      ),
    );
  }
}
