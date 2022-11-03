import 'package:ecommerce/providers/navigation_provider.dart';
import 'package:ecommerce/ui/screens/products/tabs/altro_tab.dart';
import 'package:ecommerce/ui/screens/products/tabs/bibite_tab.dart';
import 'package:ecommerce/ui/screens/products/tabs/panini_tab.dart';
import 'package:ecommerce/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/buttons/primary_buttons.dart';

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
        PrimaryButton(
          text: 'Vai al Checkout',
          onTap: () {
            ref.read(navigationProvider.notifier).changePage(2);
          },
        )
      ],
      appBar: AppBar(
        elevation: 0,
        bottom: TabBar(
          padding: const EdgeInsets.only(bottom: 8),
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: AppColors.primaryColor,
          unselectedLabelColor: Colors.black54,
          indicatorColor: AppColors.primaryColor,
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
