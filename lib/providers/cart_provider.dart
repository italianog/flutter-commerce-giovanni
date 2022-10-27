// The StateNotifier class that will be passed to our StateNotifierProvider.
// This class should not expose state outside of its "state" property, which means
// no public getters/properties!
// The public methods on this class will be what allow the UI to modify the state.
import 'package:ecommerce/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends StateNotifier<List<CartProduct>> {
  // We initialize the list of todos to an empty list
  CartNotifier() : super([]);

  // Let's allow the UI to add todos.
  void addProductToCart(CartProduct product) {
    // Since our state is immutable, we are not allowed to do `state.add(todo)`.
    // Instead, we should create a new list of todos which contains the previous
    // items and the new one.
    // Using Dart's spread operator here is helpful!
    state = [...state, product];
    // No need to call "notifyListeners" or anything similar. Calling "state ="
    // will automatically rebuild the UI when necessary.
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

  bool isAlreadyInCart() {
    return false;
  }
}

// Finally, we are using StateNotifierProvider to allow the UI to interact with
// our TodosNotifier class.
final cartProvider =
    StateNotifierProvider<CartNotifier, List<CartProduct>>((ref) {
  return CartNotifier();
});
