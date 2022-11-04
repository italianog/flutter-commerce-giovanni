import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/ui/theme/app_colors.dart';
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
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 120),
                child: Image.asset(
                  widget.product.product.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Text(
                  widget.product.product.name,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(widget.product.product.description ?? ''),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text("${widget.product.quantity} x "),
                    Text(
                      NumberFormat.currency(
                              locale: 'it', symbol: '€', decimalDigits: 2)
                          .format(widget.product.product.promotionalPrice ??
                              widget.product.product.price),
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Text(
                      NumberFormat.currency(
                              locale: 'it', symbol: '€', decimalDigits: 2)
                          .format(widget.product.product.promotionalPrice !=
                                  null
                              ? widget.product.product.promotionalPrice! *
                                  widget.product.quantity
                              : widget.product.product.price *
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
                          ref.read(cartProvider.notifier).removeProductFromCart(
                              widget.product.product.id!);
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

class CouponTile extends ConsumerStatefulWidget {
  const CouponTile({
    Key? key,
    required this.coupon,
    required this.onDeleteCoupon,
  }) : super(key: key);
  final String coupon;
  final VoidCallback onDeleteCoupon;

  @override
  ConsumerState<CouponTile> createState() => _CouponTileState();
}

class _CouponTileState extends ConsumerState<CouponTile> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      title: Text(widget.coupon),
      subtitle: const Text('Coupon inserito'),
      trailing: IconButton(
        color: AppColors.primaryColor,
        icon: const Icon(
          Icons.delete,
        ),
        onPressed: () {
          widget.onDeleteCoupon();
        },
      ),
    );
  }
}
