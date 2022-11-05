import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/providers/favorites_provider.dart';
import 'package:ecommerce/ui/widgets/products/product_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesScreen extends ConsumerStatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);
  static const routeName = '/favorites-screen';

  @override
  ConsumerState<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends ConsumerState<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Product> favorites = ref.watch(favoritesProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('I tuoi preferiti'),
        ),
        body: favorites.isEmpty
            ? const Center(
                child: Text('Non hai ancora inserito preferiti'),
              )
            : ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    ProductListTile(product: favorites[index]),
                itemCount: favorites.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 16,
                ),
              ));
  }
}
