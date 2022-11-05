import 'package:ecommerce/fakedb/db.dart';
import 'package:flutter/material.dart';

import '../../../models/product.dart';
import '../../widgets/products/item_grid_tile.dart';

class ProductsOnSale extends StatefulWidget {
  const ProductsOnSale({Key? key}) : super(key: key);

  static const routeName = '/products-on-sale';

  @override
  State<ProductsOnSale> createState() => _ProductsOnSaleState();
}

class _ProductsOnSaleState extends State<ProductsOnSale> {
  final List<Product> _products = FakeDB.onSaleProducts;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('In offerta'),
      ),
      body: Column(
        children: [
          GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 32,
              mainAxisExtent: 250, // <== change the height to fit your needs
            ),
            itemCount: _products.length,
            itemBuilder: (context, index) {
              return ItemGridTile(
                product: _products[index],
              );
            },
          )
        ],
      ),
    );
  }
}
