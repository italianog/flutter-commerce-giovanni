// The StateNotifier class that will be passed to our StateNotifierProvider.
// This class should not expose state outside of its "state" property, which means
// no public getters/properties!
// The public methods on this class will be what allow the UI to modify the state.
import 'package:ecommerce/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends StateNotifier<List<CartProduct>> {
  CartNotifier() : super([]);

  void addProductToCart(CartProduct product, int? quantity) {
    if (isAlreadyInCart(product)) {
      //TODO non fare niente
    } else {
      state = [...state, product];
    }
  }

  // Let's allow removing todos
  void removeProductFromCart(int productId) {
    // Again, our state is immutable. So we're making a new list instead of
    // changing the existing list.
    state = [
      for (final product in state)
        if (product.id != productId) product,
    ];
  }

  double getTotalAmount() {
    double sum = 0;
    for (final product in state) {
      sum += product.price;
    }
    return sum;
  }

  bool isAlreadyInCart(Product product) {
    for (final element in state) {
      if (element.id == product.id) {
        print('already in cart');
        return true;
      }
    }
    return false;
  }
}

// Finally, we are using StateNotifierProvider to allow the UI to interact with
// our TodosNotifier class.
final cartProvider =
    StateNotifierProvider<CartNotifier, List<CartProduct>>((ref) {
  return CartNotifier();
});
