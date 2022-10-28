// The StateNotifier class that will be passed to our StateNotifierProvider.
// This class should not expose state outside of its "state" property, which means
// no public getters/properties!
// The public methods on this class will be what allow the UI to modify the state.
import 'package:ecommerce/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends StateNotifier<List<CartProduct>> {
  CartNotifier() : super([]);

  int findProductInCart(Product product) {
    int foundIndex = -1;
    for (int i = 0; i < state.length; i++) {
      if (state[i].product.id == product.id) {
        foundIndex = i;
      }
    }
    return foundIndex;
  }

  bool validateCoupon() {
    return true;
  }

  void emptyCart() {
    state = [];
  }

  void addProductToCart(
      {required Product product, int? quantity, String? color, String? size}) {
    int foundIndex = findProductInCart(product);
    if (foundIndex == -1) {
      state = [
        ...state,
        CartProduct(
          product: product,
          quantity: quantity ?? 1,
        )
      ];
    } else {
      state = [
        for (var i = 0; i < state.length; i++)
          if (i == foundIndex)
            CartProduct(
                product: state[i].product, quantity: state[i].quantity + 1)
          else
            state[i]
      ];
    }
  }

  // Let's allow removing todos
  void removeProductFromCart(int productId) {
    // Again, our state is immutable. So we're making a new list instead of
    // changing the existing list.
    state = [
      for (final product in state)
        if (product.product.id != productId) product,
    ];
  }

  double getTotalAmount() {
    double sum = 0;
    for (final product in state) {
      sum += product.product.price * product.quantity;
    }
    return sum;
  }

  int getTotalQty() {
    int count = 0;
    for (final element in state) {
      count += element.quantity;
    }
    return count;
  }

  void decreaseQuantity(CartProduct cartProduct) {
    int foundIndex = findProductInCart(cartProduct.product);
    if (foundIndex == -1) {
      state = [
        ...state,
        CartProduct(
            product: cartProduct.product, quantity: (cartProduct.quantity) + 1)
      ];
    } else {
      state = [
        for (var i = 0; i < state.length; i++)
          if (i == foundIndex)
            if (state[i].quantity > 1)
              CartProduct(
                  product: state[i].product, quantity: state[i].quantity - 1)
            else
              state[i]
      ];
    }
  }

  void increaseQuantity(CartProduct cartProduct) {
    int foundIndex = findProductInCart(cartProduct.product);
    if (foundIndex == -1) {
      state = [
        ...state,
        CartProduct(
            product: cartProduct.product, quantity: (cartProduct.quantity) + 1)
      ];
    } else {
      state = [
        for (var i = 0; i < state.length; i++)
          if (i == foundIndex)
            CartProduct(
                product: state[i].product, quantity: state[i].quantity + 1)
          else
            state[i]
      ];
    }
  }
}

// Finally, we are using StateNotifierProvider to allow the UI to interact with
// our TodosNotifier class.
final cartProvider =
    StateNotifierProvider<CartNotifier, List<CartProduct>>((ref) {
  return CartNotifier();
});
