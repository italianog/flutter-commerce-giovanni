import 'package:badges/badges.dart';
import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/providers/navigation_provider.dart';
import 'package:ecommerce/ui/screens/cart_screen.dart';
import 'package:ecommerce/ui/screens/home_screen.dart';
import 'package:ecommerce/ui/screens/products_main.dart';
import 'package:ecommerce/ui/screens/profile_screen.dart';
import 'package:ecommerce/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  int _currentIndex = 0;
  String value = '0';
  @override
  Widget build(BuildContext context) {
    final page = ref.watch(navigationProvider);
    ref.listen(cartProvider, (previous, next) {
      int count = 0;
      for (final element in next) {
        count += element.quantity;
      }
      setState(() {
        value = count.toString();
      });
    });

    return Scaffold(
/*
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
*/
      body: _buildChild(maintainState: true, page: page),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 8,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: const IconThemeData(color: AppColors.primaryColor),
        unselectedIconTheme: IconThemeData(
          color: Colors.grey[500],
        ),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: page,
        iconSize: 22,
        onTap: (index) {
          setState(() {
            ref.read(navigationProvider.notifier).changePage(index);
          });
        },
        items: [
          const BottomNavigationBarItem(
            label: 'Home',
            icon: FaIcon(FontAwesomeIcons.houseUser),
          ),
          const BottomNavigationBarItem(
            label: 'Prodotti',
            icon: FaIcon(FontAwesomeIcons.store),
          ),
          BottomNavigationBarItem(
            label: 'Carrello',
            icon: Badge(
              badgeColor: AppColors.primaryColor,
              badgeContent: Text(
                value,
                style: const TextStyle(fontSize: 10, color: Colors.white),
              ),
              toAnimate: false,
              child: const FaIcon(FontAwesomeIcons.cartShopping),
            ),
          ),
          const BottomNavigationBarItem(
            label: 'Profilo',
            icon: FaIcon(FontAwesomeIcons.user),
          ),
        ],
      ),
    );
  }

  _buildChild({required bool maintainState, int? page}) {
    if (maintainState) {
      return IndexedStack(
        index: page,
        children: const [
          HomeScreen(),
          ProductsMain(),
          CartScreen(),
          ProfileScreen(),
        ],
      );
    } else {
      switch (page) {
        case 0:
          return const HomeScreen();
        case 1:
          return const ProductsMain();
        case 2:
          return const CartScreen();
        case 3:
          return const ProfileScreen();
        default:
          return const HomeScreen();
      }
    }
  }
}
