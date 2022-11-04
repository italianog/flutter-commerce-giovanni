import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/app_colors.dart';

class CouponBox extends StatelessWidget {
  const CouponBox({Key? key}) : super(key: key);

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
