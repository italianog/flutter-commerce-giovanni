import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/ui/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _loaded = true;
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
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    const Center(
                      child: Text('Ordine effettuato con successo'),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            ref.read(cartProvider.notifier).emptyCart();
                            Navigator.of(context)
                                .pushNamedAndRemoveUntil('/', (route) => false);
                          },
                          child: const Text('Vai alla home')),
                    )
                  ],
                ),
        ],
      ),
    );
  }
}
