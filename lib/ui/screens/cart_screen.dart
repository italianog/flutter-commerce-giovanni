import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/ui/widgets/products/cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../models/product.dart';
import '../theme/app_colors.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName = '/cart-screen';

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool validateCart() {
    const snackBar = SnackBar(
      content: Text('Il tuo carrello è vuoto'),
    );
    if (ref.read(cartProvider).isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return false;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    List<Product> products = ref.watch(cartProvider);
    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      appBar: AppBar(
        title: Text('Carrello'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Il tuo carrello'),
              const SizedBox(
                height: 20,
              ),
              if (products.isEmpty)
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: const Center(
                    child: Text('Il tuo carrello è attualmente vuoto'),
                  ),
                )
              else
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: products.length,
                  itemBuilder: (context, index) => CartTile(
                    product: products[index],
                    onDeleteProduct: () {
                      var snackBar = SnackBar(
                        content: Text(
                            'Hai rimosso dal carrello: ${products[index].name}'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 24,
                  ),
                ),
              const SizedBox(
                height: 24,
              ),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Coupon',
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black)),
                onPressed: () {
                  validateCart();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      const Icon(Icons.credit_card),
                      const SizedBox(
                        width: 16,
                      ),
                      const Text('Conferma'),
                      const Spacer(),
                      Text(
                        NumberFormat.currency(
                                locale: 'it', symbol: '€', decimalDigits: 2)
                            .format(
                          ref.read(cartProvider.notifier).getTotalAmount(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
