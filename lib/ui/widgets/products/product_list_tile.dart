import 'package:flutter/material.dart';

import '../../../models/product.dart';

class ProductListTile extends StatefulWidget {
  const ProductListTile({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<ProductListTile> createState() => _ProductListTileState();
}

class _ProductListTileState extends State<ProductListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      contentPadding: const EdgeInsets.all(8),
      leading: Image.asset(widget.product.image),
      title: Text(widget.product.name),
      trailing: IconButton(
        icon: const Icon(Icons.remove),
        onPressed: () {},
      ),
    );
  }
}
