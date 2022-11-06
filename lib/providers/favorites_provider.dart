import 'package:ecommerce/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesNotifier extends StateNotifier<List<Product>> {
  FavoritesNotifier() : super([]);

  void addToFavorites(Product product) {
    state = [...state, product];
  }

  void removeProductFromFavorites(String productId) {
    state = [
      for (final product in state)
        if (product.id != productId) product,
    ];
  }

  bool isFavorite(String id) {
    bool found = false;
    for (var element in state) {
      if (element.id == id) found = true;
    }
    return found;
  }
}

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, List<Product>>((ref) {
  return FavoritesNotifier();
});
