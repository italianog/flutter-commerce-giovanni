import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const routeName = '/splash-screen';

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  Future<void> initApplication() async {
    return;
  }

  @override
  void initState() {
    super.initState();
    initApplication();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
