import 'package:ecommerce/providers/favorites_provider.dart';
import 'package:ecommerce/ui/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../models/product.dart';
import '../../../providers/cart_provider.dart';
import '../../theme/app_colors.dart';

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
    return InkWell(
      onLongPress: () {
        Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
            arguments: widget.product);
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            AppShadows.defaultShadow,
          ],
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
                            if (widget.product.promotionalPrice != null)
                              Text(
                                NumberFormat.currency(
                                        locale: 'it',
                                        symbol: '€',
                                        decimalDigits: 2)
                                    .format(widget.product.promotionalPrice),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              )
                            else
                              Text(
                                NumberFormat.currency(
                                        locale: 'it',
                                        symbol: '€',
                                        decimalDigits: 2)
                                    .format(widget.product.price),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              )
                          ],
                        ),
                      ),
                      if (widget.product.availableQuantity != 0)
                        Expanded(
                          flex: 4,
                          child: IconButton(
                              onPressed: () {
                                ref
                                    .read(cartProvider.notifier)
                                    .addProductToCart(
                                        product: widget.product, quantity: 1);
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        '${widget.product.name} aggiunto al carrello')));
                              },
                              icon: const Icon(
                                Icons.add_circle,
                                color: AppColors.primaryColor,
                                size: 32,
                              )),
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
                  _isFavorite
                      ? ref
                          .read(favoritesProvider.notifier)
                          .addToFavorites(widget.product)
                      : ref
                          .read(favoritesProvider.notifier)
                          .removeProductFromFavorites(widget.product.id);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor:
                          _isFavorite ? Colors.red : Colors.black54,
                      content: Text(_isFavorite
                          ? 'Aggiunto a preferiti'
                          : 'Rimosso dai preferiti'),
                    ),
                  );
                });
              },
            )),
            if (widget.product.availableQuantity == 0)
              const Positioned(
                  right: 4,
                  child: Chip(
                    backgroundColor: Colors.amber,
                    padding: EdgeInsets.all(0),
                    label: Text(
                      'Non disponibile',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  )),
          ],
        ),
      ),
    );
  }
}
