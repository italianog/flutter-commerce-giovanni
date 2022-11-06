import 'package:ecommerce/ui/screens/order_detail_screen.dart';
import 'package:ecommerce/ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/order.dart';
import '../theme/app_colors.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          AppShadows.defaultShadow,
        ],
      ),
      child: ListTile(
        isThreeLine: true,
        contentPadding: const EdgeInsets.all(16),
        onTap: () {
          Navigator.of(context)
              .pushNamed(OrderDetailScreen.routeName, arguments: order);
        },
        tileColor: Colors.white,
        leading: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 80, minWidth: 80),
            child: Image.asset(order.products[0].product.image)),
        title: Text(dateFormat.format(order.createdAt)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              order.products.length == 1
                  ? order.products[0].product.name
                  : '${order.products[0].product.name} e altri ${order.products.length - 1} prodotti',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Totale ordine: ${NumberFormat.currency(locale: 'it', symbol: '€', decimalDigits: 2).format(order.totalAmount)}',
              style: const TextStyle(fontWeight: FontWeight.w500),
            )
          ],
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
