import 'package:ecommerce/ui/screens/cart_screen.dart';
import 'package:ecommerce/ui/screens/home_screen.dart';
import 'package:ecommerce/ui/screens/notifications_screen.dart';
import 'package:ecommerce/ui/screens/products_screen.dart';
import 'package:ecommerce/ui/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'favorites_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Flutter e-commerce'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(NotificationsScreen.routeName);
            },
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
            icon: const FaIcon(
              FontAwesomeIcons.cartShopping,
              size: 20,
            ),
          )
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
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.houseUser),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.dotCircle),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.cartShopping),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user),
          ),
        ],
      ),
    );
  }
}
