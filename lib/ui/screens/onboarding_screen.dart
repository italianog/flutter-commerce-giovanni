import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce/ui/screens/main_screen.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  static const routeName = '/on-boarding-screen';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              'Benvenuto nel tuo e-commerce',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 200,
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.only(right: 16),
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            DotsIndicator(
              dotsCount: 3,
              position: _currentIndex.toDouble(),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/', (route) => false);
              },
              child: const Text('Prosegui'),
            )
          ],
        ),
      ),
    );
  }
}
