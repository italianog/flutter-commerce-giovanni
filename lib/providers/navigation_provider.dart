import 'package:flutter_riverpod/flutter_riverpod.dart';

enum NavigationPages { HOME, PRODUCTS, CART, PROFILE }

class NavigationNotifier extends StateNotifier<int> {
  NavigationNotifier() : super(0);

  void changePage(int index) {
    state = index;
  }
}

final navigationProvider =
    StateNotifierProvider<NavigationNotifier, int>((ref) {
  return NavigationNotifier();
});
