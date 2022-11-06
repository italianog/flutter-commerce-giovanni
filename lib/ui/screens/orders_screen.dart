import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/order.dart';
import 'package:ecommerce/providers/auth_provider.dart';
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
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('orders')
                    .where('user_id',
                        isEqualTo: '${ref.read(authProvider)?.uid}')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                    return ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final Order order =
                              Order.fromMap(snapshot.data!.docs[index].data());
                          return OrderTile(order: order);
                        },
                        separatorBuilder: (context, index) => const SizedBox(),
                        itemCount: snapshot.data!.docs.length);
                  } else if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text('Non hai ancora effettuato ordini'),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}
