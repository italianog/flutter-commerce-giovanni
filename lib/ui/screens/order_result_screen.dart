import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/fakedb/db.dart';
import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/providers/navigation_provider.dart';
import 'package:ecommerce/ui/screens/main_screen.dart';
import 'package:ecommerce/ui/screens/order_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/order.dart';
import '../theme/app_colors.dart';

class OrderResultScreen extends ConsumerStatefulWidget {
  const OrderResultScreen({
    Key? key,
  }) : super(key: key);

  static const routeName = '/order-result-screen';

  @override
  ConsumerState createState() => _OrderResultScreenState();
}

class _OrderResultScreenState extends ConsumerState<OrderResultScreen> {
  bool _loaded = false;
  Order? order;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      order = ModalRoute.of(context)?.settings.arguments as Order?;
      setState(() {
        _loaded = true;
        FirebaseFirestore.instance.collection('/orders').add(
              order!.toMap(),
            );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          !_loaded
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                )
              : Column(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: AppColors.primaryColor,
                      size: 80,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Center(
                      child: Text(
                        'Ordine effettuato con successo',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                        'Il tuo ordine sarà disponibile a breve nel nostro negozio'),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.primaryColor),
                          ),
                          onPressed: () {
                            ref.read(cartProvider.notifier).emptyCart();
                            ref.read(navigationProvider.notifier).changePage(0);
                            Navigator.of(context)
                                .pushNamedAndRemoveUntil('/', (route) => false);
                          },
                          child: const Text('Vai alla home')),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                        ),
                        onPressed: () {
                          ref.read(navigationProvider.notifier).changePage(0);
                          ref.read(cartProvider.notifier).emptyCart();
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              OrderDetailScreen.routeName,
                              ModalRoute.withName(MainScreen.routeName),
                              arguments: order);
                        },
                        child: const Text('Vai al dettaglio ordine'),
                      ),
                    )
                  ],
                ),
        ],
      ),
    );
  }
}
