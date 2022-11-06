import 'package:ecommerce/fakedb/db.dart';
import 'package:ecommerce/ui/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/cli_commands.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../models/product.dart';

class PreviewOffersList extends ConsumerStatefulWidget {
  const PreviewOffersList({Key? key}) : super(key: key);

  @override
  ConsumerState<PreviewOffersList> createState() => _PreviewProductsListState();
}

class _PreviewProductsListState extends ConsumerState<PreviewOffersList> {
  final List<Product> onSaleProducts = FakeDB.onSaleProducts;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.separated(
          clipBehavior: Clip.none,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              ProductPreview(product: FakeDB.onSaleProducts[index]),
          separatorBuilder: (context, index) => const SizedBox(
                width: 32,
              ),
          itemCount: FakeDB.onSaleProducts.length),
    );
  }
}

class ProductPreview extends StatelessWidget {
  const ProductPreview({Key? key, required this.product}) : super(key: key);

  final Product product;

  Text _calculateOffer() {
    double perc = (1 - product.promotionalPrice! / product.price) * 100;

    return Text(
      '${perc.toStringAsFixed(0)} %',
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ProductDetailScreen.routeName, arguments: product);
      },
      child: Stack(
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 4),
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 12,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 70,
                    ),
                    child: Image.asset(
                      product.image,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  product.name.capitalize(),
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      NumberFormat.currency(
                              locale: 'it', symbol: '€', decimalDigits: 2)
                          .format(product.price),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.lineThrough),
                    ),
                    Text(
                      NumberFormat.currency(
                              locale: 'it', symbol: '€', decimalDigits: 2)
                          .format((product.promotionalPrice)),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    /*    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border),
                    )*/
                  ],
                )
              ],
            ),
          ),
          Positioned(
            right: 8,
            child: Chip(
              padding: EdgeInsets.zero,
              backgroundColor: Colors.redAccent.shade100,
              label: _calculateOffer(),
            ),
          ),
        ],
      ),
    );
  }
}
