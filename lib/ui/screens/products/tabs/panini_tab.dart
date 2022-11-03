import 'package:ecommerce/fakedb/products.dart';
import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../models/product.dart';
import '../../../widgets/products/item_grid_tile.dart';

class PaniniTab extends StatelessWidget {
  const PaniniTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 32,
              mainAxisExtent: 250, // <== change the height to fit your needs
            ),
            itemCount: FakeDB.getProductsByCategory('panini').length,
            itemBuilder: (context, index) {
              final List<Product> products =
                  FakeDB.getProductsByCategory('panini');
              return ItemGridTile(
                product: products[index],
              );
            },
          ),
        )
      ],
    );
  }
}
