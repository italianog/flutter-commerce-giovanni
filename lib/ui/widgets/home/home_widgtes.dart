import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/app_colors.dart';

class CouponsList extends StatefulWidget {
  const CouponsList({Key? key}) : super(key: key);

  @override
  State<CouponsList> createState() => _CouponsListState();
}

class _CouponsListState extends State<CouponsList> {
  double activeIndex = 0;
  final List<CouponBox> coupons = const [
    CouponBox(
      text:
          'Non hai ancora riscattato il tuo primo coupon! Affrettati scade il 31/12/2022',
      icon: Icons.airplane_ticket_outlined,
    ),
    CouponBox(
      text: 'Coupon #2',
      icon: Icons.folder_open,
    ),
    CouponBox(
      text: 'Coupon #3',
      icon: Icons.folder_open,
    ),
    CouponBox(
      text: 'Coupon #4',
      icon: Icons.folder_open,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 240,
          child: PageView.builder(
            itemCount: coupons.length,
            onPageChanged: (index) {
              setState(() {
                activeIndex = index.toDouble();
              });
            },
            itemBuilder: (context, index) => coupons[index],
          ),
        ),
        Center(
          child: DotsIndicator(
            position: activeIndex,
            dotsCount: coupons.length,
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              activeColor: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}

class CouponBox extends StatelessWidget {
  const CouponBox({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          isDismissible: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          ),
          builder: (context) => DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.2,
            maxChildSize: 0.8,
            expand: false,
            builder: (context, scrollController) => SafeArea(
              child: ListView.builder(
                controller: scrollController,
                itemCount: 4,
                itemBuilder: (context, index) => ListTile(
                  title: Text(index.toString()),
                  onTap: () => Navigator.of(context).pop(index),
                ),
              ),
            ),
          ),
        );
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
          children: [
            Expanded(
              flex: 7,
              child: Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const Expanded(
                flex: 3,
                child: Icon(
                  Icons.airplane_ticket,
                  size: 100,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
