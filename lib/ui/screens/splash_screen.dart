import 'package:ecommerce/providers/auth_provider.dart';
import 'package:ecommerce/providers/secure_storage_provider.dart';
import 'package:ecommerce/ui/screens/main_screen.dart';
import 'package:ecommerce/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const routeName = '/splash-screen';

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  void initApplication() async {
    ref.read(authProvider.notifier).getCurrentUser();
    //TODO TEST
    await ref.read(secureStorageProvider).write(key: 'key', value: 'value');
    final value = await ref.read(secureStorageProvider).read(key: 'key');
    print(value);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initApplication();
    });

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(MainScreen.routeName, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: const Text(
            'Stiamo scaldando le piastre...',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        SvgPicture.asset(
          'assets/images/logo.svg',
          width: 150,
          height: 150,
        ),
        const SizedBox(
          height: 64,
        ),
        const CircularProgressIndicator(
          color: AppColors.primaryColor,
        )
      ],
    );
  }
}
