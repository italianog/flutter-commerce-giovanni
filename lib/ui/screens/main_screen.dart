import 'package:badges/badges.dart';
import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/ui/screens/cart_screen.dart';
import 'package:ecommerce/ui/screens/home_screen.dart';
import 'package:ecommerce/ui/screens/notifications_screen.dart';
import 'package:ecommerce/ui/screens/products_screen.dart';
import 'package:ecommerce/ui/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Flutter e-commerce',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(NotificationsScreen.routeName);
            },
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          HomeScreen(),
          ProductsScreen(),
          CartScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        iconSize: 22,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.houseUser),
          ),
          const BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.store),
          ),
          BottomNavigationBarItem(
            icon: Badge(
              badgeColor: Colors.blueAccent,
              badgeContent: Text(
                '${cart.length}',
                style: const TextStyle(fontSize: 10, color: Colors.white),
              ),
              toAnimate: false,
              child: const FaIcon(FontAwesomeIcons.cartShopping),
            ),
          ),
          const BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user),
          ),
        ],
      ),
    );
  }
}
