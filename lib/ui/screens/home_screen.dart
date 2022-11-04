import 'package:ecommerce/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../providers/navigation_provider.dart';
import '../widgets/home/home_widgtes.dart';
import '../widgets/products/preview_product_list.dart';
import '../widgets/row_title.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const WelcomeCard(),
            const SizedBox(
              height: 8,
            ),
            RowTitle(
              title: 'Prodotti in evidenza',
              onTap: () {
                ref.read(navigationProvider.notifier).changePage(1);
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: PreviewProductsList(),
            ),
            const SizedBox(
              height: 20,
            ),
            const CouponBox(),
          ],
        ),
      ),
    );
  }
}
