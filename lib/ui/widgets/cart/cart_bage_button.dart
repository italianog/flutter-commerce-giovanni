import 'package:badges/badges.dart';
import 'package:ecommerce/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartBadgeButton extends ConsumerStatefulWidget {
  const CartBadgeButton({Key? key}) : super(key: key);

  @override
  _CartBadgeButtonState createState() => _CartBadgeButtonState();
}

class _CartBadgeButtonState extends ConsumerState<CartBadgeButton> {
  @override
  Widget build(BuildContext context) {
    final cart = ref.read(cartProvider);
    return Badge(
      badgeContent: Text('${cart.length}'),
      child: const Icon(Icons.shopping_cart_sharp),
    );
  }
}
