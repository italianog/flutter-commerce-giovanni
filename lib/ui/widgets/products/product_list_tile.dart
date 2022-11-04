import 'package:flutter/material.dart';

import '../../../models/product.dart';
import '../../theme/app_colors.dart';

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
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          AppShadows.defaultShadow,
        ],
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: ListTile(
        tileColor: Colors.white,
        contentPadding: const EdgeInsets.all(16),
        leading: Image.asset(widget.product.image),
        title: Text(widget.product.name),
        trailing: IconButton(
          icon: const Icon(
            Icons.close,
            size: 30,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
