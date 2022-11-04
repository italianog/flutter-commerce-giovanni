import 'package:ecommerce/fakedb/db.dart';
import 'package:ecommerce/ui/widgets/buttons/primary_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../models/order.dart';

class OrderDetailScreen extends ConsumerStatefulWidget {
  const OrderDetailScreen({
    Key? key,
  }) : super(key: key);

  static const routeName = '/order-detail-screen';

  @override
  ConsumerState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends ConsumerState<OrderDetailScreen> {
  late Order _order;
  DateFormat dateFormat = DateFormat("yyyy/MM/dd HH:mm");

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _order = ModalRoute.of(context)?.settings.arguments as Order;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ordine'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Ordine del ${dateFormat.format(_order.createdAt)}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => ListTile(
                        trailing: Text('x ${_order.products[index].quantity}'),
                        contentPadding: const EdgeInsets.all(16),
                        tileColor: Colors.white,
                        leading: SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.asset(
                            _order.products[index].product.image,
                          ),
                        ),
                        title: Text(_order.products[index].product.name),
                        subtitle: Text(
                          NumberFormat.currency(
                                  locale: 'it', symbol: '€', decimalDigits: 2)
                              .format(_order.products[index].product.price),
                        ),
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 16,
                      ),
                  itemCount: _order.products.length),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    const Text('Totale'),
                    const Spacer(),
                    Text(
                      NumberFormat.currency(
                              locale: 'it', symbol: '€', decimalDigits: 2)
                          .format(
                        FakeDB().getTotalFromOrder(_order),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              PrimaryButton(onTap: () {}, text: 'Contattaci')
            ],
          ),
        ),
      ),
    );
  }
}
