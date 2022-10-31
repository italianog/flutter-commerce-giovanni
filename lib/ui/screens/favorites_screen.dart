import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/ui/widgets/no_data.dart';
import 'package:flutter/material.dart';

import '../../models/product.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);
  static const routeName = '/favorites-screen';

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Product> _products = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('I tuoi preferiti'),
      ),
      body: _products.isNotEmpty
          ? SingleChildScrollView(
              child: Column(
                children: [
                  ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => ListTile(
                            leading: CachedNetworkImage(
                              imageUrl: "http://via.placeholder.com/350x150",
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      CircularProgressIndicator(
                                          value: downloadProgress.progress),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 16,
                          ),
                      itemCount: _products.length),
                ],
              ),
            )
          : const NoData(
              text: 'Non hai ancora inserito prodotti nei preferiti',
            ),
    );
  }
}
