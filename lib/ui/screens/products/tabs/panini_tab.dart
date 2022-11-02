import 'package:ecommerce/fakedb/products.dart';
import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../models/product.dart';

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
            itemCount: FakeDB.getPanini().length,
            itemBuilder: (context, index) {
              final List<Product> products = FakeDB.getPanini();
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

class ItemGridTile extends ConsumerStatefulWidget {
  const ItemGridTile({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  ConsumerState<ItemGridTile> createState() => _ItemGridTileState();
}

class _ItemGridTileState extends ConsumerState<ItemGridTile> {
  bool _isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [AppShadows.defaultShadow],
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 100),
                child: Image.asset(
                  widget.product.image,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.product.name),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            NumberFormat.currency(
                                    locale: 'it', symbol: '€', decimalDigits: 2)
                                .format(widget.product.price),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: IconButton(
                          onPressed: () {
                            ref.read(cartProvider.notifier).addProductToCart(
                                product: widget.product, quantity: 1);
                          },
                          icon: const Icon(Icons.add_circle)),
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              child: IconButton(
            icon: _isFavorite
                ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : const Icon(Icons.favorite_border),
            onPressed: () {
              setState(() {
                _isFavorite = !_isFavorite;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: _isFavorite ? Colors.red : Colors.black54,
                    content: Text(_isFavorite
                        ? 'Aggiunto a preferiti'
                        : 'Rimosso dai preferiti'),
                  ),
                );
              });
            },
          ))
        ],
      ),
    );
  }
}
