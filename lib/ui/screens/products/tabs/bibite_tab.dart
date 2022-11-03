import 'package:ecommerce/ui/screens/products/tabs/panini_tab.dart';
import 'package:flutter/material.dart';

import '../../../../fakedb/products.dart';
import '../../../../models/product.dart';
import '../../../widgets/products/item_grid_tile.dart';

class BibiteTab extends StatelessWidget {
  const BibiteTab({Key? key}) : super(key: key);

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
            itemCount: FakeDB.getProductsByCategory(category: 'bibite').length,
            itemBuilder: (context, index) {
              final List<Product> products =
                  FakeDB.getProductsByCategory(category: 'bibite');
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
