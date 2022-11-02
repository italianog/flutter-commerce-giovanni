import 'package:ecommerce/providers/navigation_provider.dart';
import 'package:ecommerce/ui/screens/products/tabs/altro_tab.dart';
import 'package:ecommerce/ui/screens/products/tabs/bibite_tab.dart';
import 'package:ecommerce/ui/screens/products/tabs/panini_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsMain extends ConsumerStatefulWidget {
  const ProductsMain({Key? key}) : super(key: key);
  static const routeName = '/products-main-screen';

  @override
  ConsumerState<ProductsMain> createState() => _ProductsMainState();
}

class _ProductsMainState extends ConsumerState<ProductsMain>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            child: const Text('Vai al Checkout'),
            onPressed: () {
              ref.read(navigationProvider.notifier).changePage(2);
            },
          ),
        )
      ],
      appBar: AppBar(
        elevation: 0,
        actions: [
          /*   Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart_sharp),
              ),
              Positioned(
                  right: 4,
                  child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black),
                    padding: const EdgeInsets.all(3),
                    child: Text(ref.watch(cartProvider).length.toString()),
                  ))
            ],
          ),
          const SizedBox(
            width: 8,
          )*/
        ],
        bottom: TabBar(
          padding: const EdgeInsets.only(bottom: 8),
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.black54,
          tabs: const [
            Text('Panini'),
            Text('Bibite'),
            Text('Altro'),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                PaniniTab(),
                BibiteTab(),
                AltroTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
