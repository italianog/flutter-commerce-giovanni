import 'package:ecommerce/ui/screens/order_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/order.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(16),
      onTap: () {
        Navigator.of(context)
            .pushNamed(OrderDetailScreen.routeName, arguments: order);
      },
      tileColor: Colors.white,
      leading: Image.asset(order.products[0].product.image),
      title: Text(DateFormat.yMMMMd().format(order.createdAt)),
      subtitle: Text(order.products[0].product.name),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
