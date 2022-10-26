import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/ui/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';

import '../../apis/apis.dart';
import '../../models/product.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);
  static String routeName = '/products-screen';

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Product>? _products;
  Future getProducts() async {
    Apis apis = Apis();
    _products = await apis.getProducts();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          if (_products != null)
            GridView.builder(
              padding: const EdgeInsets.all(16),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: _products!.length,
              itemBuilder: (BuildContext ctx, index) {
                return Column(
                  children: [
                    //CachedNetworkImage(imageUrl: _products![index].image),
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        height: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(_products![index].name),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            ProductDetailScreen.routeName,
                            arguments: _products![index]);
                      },
                    ),
                  ],
                );
              },
            ),
        ],
      ),
    );
  }
}
