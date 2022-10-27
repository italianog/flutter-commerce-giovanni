import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/ui/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

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
    const cellRed = Color(0xffc73232);
    const cellMustard = Color(0xffd7aa22);
    const cellGrey = Color(0xffcfd4e0);
    const cellBlue = Color(0xff1553be);
    const background = Color(0xff242830);
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
                  crossAxisSpacing: 20,
                  childAspectRatio: 1,
                  mainAxisSpacing: 20),
              itemCount: _products!.length,
              itemBuilder: (BuildContext ctx, index) {
                return Column(
                  children: [
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        height: 145,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(_products![index].image),
                            fit: BoxFit.contain,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration:
                                const BoxDecoration(color: Colors.black87),
                            child: Text(
                              _products![index].name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
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
