import 'package:ecommerce/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../providers/navigation_provider.dart';
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
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              decoration: BoxDecoration(
                boxShadow: [
                  AppShadows.defaultShadow,
                ],
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFfbab7e),
                    Color(0xFFF7CE68),
                  ],
                  begin: Alignment(-1.0, 0.0),
                  end: Alignment(
                    1.0,
                    0.0,
                  ),
                  transform: GradientRotation(0.7853982),
                ),
              ),
              child: Row(
                children: [
                  const Expanded(
                    flex: 7,
                    child: Text(
                      'Bentornato Gaetano,\ncosa desideri ordinare oggi? ',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 24),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      child: SvgPicture.asset(
                        'assets/images/logo.svg',
                        height: 200,
                      ),
                    ),
                  )
                ],
              ),
            ),
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
            InkWell(
              onTap: () {
                ref.read(navigationProvider.notifier).changePage(3);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                decoration: BoxDecoration(
                  boxShadow: [
                    AppShadows.defaultShadow,
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primaryColor.withOpacity(0.65),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Expanded(
                      flex: 7,
                      child: Text(
                        'Non hai ancora riscattato il tuo primo coupon! Affrettati scade il 31/12/2022',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Icon(
                          Icons.airplane_ticket,
                          size: 100,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
