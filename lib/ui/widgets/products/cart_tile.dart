import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../models/product.dart';

class CartTile extends ConsumerStatefulWidget {
  const CartTile({
    Key? key,
    required this.product,
    required this.onDeleteProduct,
  }) : super(key: key);
  final CartProduct product;
  final VoidCallback onDeleteProduct;

  @override
  ConsumerState<CartTile> createState() => _CartTileState();
}

class _CartTileState extends ConsumerState<CartTile> {
  @override
  void initState() {
    super.initState();
    _actualqty = widget.product.quantity!;
    setState(() {});
  }

  late int _actualqty;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              height: 100,
              width: 100,
              imageUrl: widget.product.product.image,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Text(
                  widget.product.product.name,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text("${widget.product.quantity} x "),
                    Text(
                      NumberFormat.currency(
                              locale: 'it', symbol: '€', decimalDigits: 2)
                          .format(widget.product.product.price),
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Text(
                      NumberFormat.currency(
                              locale: 'it', symbol: '€', decimalDigits: 2)
                          .format(widget.product.product.price *
                              widget.product.quantity),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              if (_actualqty > 1) {
                                ref
                                    .read(cartProvider.notifier)
                                    .decreaseQuantity(widget.product);
                                setState(() {
                                  _actualqty--;
                                });
                              }
                            },
                            icon: const Icon(
                              Icons.remove_circle_outline,
                              color: Colors.black54,
                            )),
                        Text(
                          _actualqty.toString(),
                          style: const TextStyle(fontSize: 18),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _actualqty++;
                              ref
                                  .read(cartProvider.notifier)
                                  .increaseQuantity(widget.product);
                            });
                          },
                          icon: const Icon(Icons.add_circle_outline,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          ref
                              .read(cartProvider.notifier)
                              .removeProductFromCart(widget.product.product.id);
                          widget.onDeleteProduct();
                        },
                        icon: const Icon(Icons.delete_outline,
                            color: Colors.black54))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}