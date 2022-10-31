import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/ui/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/cli_commands.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/product.dart';

class PreviewProductsList extends ConsumerStatefulWidget {
  const PreviewProductsList({Key? key}) : super(key: key);

  @override
  ConsumerState<PreviewProductsList> createState() =>
      _PreviewProductsListState();
}

class _PreviewProductsListState extends ConsumerState<PreviewProductsList> {
  final List<Product> _products = const [
    Product(
      name: 'CHRONOGRAPH BLUE ORANGE',
      id: 1,
      price: 299.99,
      promotionalPrice: 280.99,
      isAvailable: true,
      availableQuantity: 10,
      image:
          'https://www.lilienthal.berlin/media/image/14/64/43/C01-108-B023EB_010.jpg',
    ),
    Product(
      name: 'CHRONOGRAPH BLUE ORANGE',
      id: 1,
      price: 299.99,
      promotionalPrice: 280.99,
      isAvailable: true,
      availableQuantity: 10,
      image:
          'https://www.lilienthal.berlin/media/image/14/64/43/C01-108-B023EB_010.jpg',
    ),
    Product(
      name: 'CHRONOGRAPH BLUE ORANGE',
      id: 1,
      price: 299.99,
      promotionalPrice: 280.99,
      isAvailable: true,
      availableQuantity: 10,
      image:
          'https://www.lilienthal.berlin/media/image/14/64/43/C01-108-B023EB_010.jpg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.separated(
          clipBehavior: Clip.none,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              ProductPreview(product: _products[index]),
          separatorBuilder: (context, index) => const SizedBox(
                width: 32,
              ),
          itemCount: _products.length),
    );
  }
}

class ProductPreview extends StatelessWidget {
  const ProductPreview({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ProductDetailScreen.routeName, arguments: product);
      },
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 0), // changes position of shadow
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
              child: CachedNetworkImage(
                imageUrl: product.image,
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              product.name.capitalize(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
