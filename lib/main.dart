import 'package:ecommerce/ui/screens/address_form_screen.dart';
import 'package:ecommerce/ui/screens/addresses_screen.dart';
import 'package:ecommerce/ui/screens/cart_screen.dart';
import 'package:ecommerce/ui/screens/main_screen.dart';
import 'package:ecommerce/ui/screens/notification_detail_screen.dart';
import 'package:ecommerce/ui/screens/notifications_screen.dart';
import 'package:ecommerce/ui/screens/onboarding_screen.dart';
import 'package:ecommerce/ui/screens/order_detail_screen.dart';
import 'package:ecommerce/ui/screens/orders_screen.dart';
import 'package:ecommerce/ui/screens/otp_screen.dart';
import 'package:ecommerce/ui/screens/privacy_policy_screen.dart';
import 'package:ecommerce/ui/screens/product_detail_screen.dart';
import 'package:ecommerce/ui/screens/products_screen.dart';
import 'package:ecommerce/ui/screens/sign_up_screen.dart';
import 'package:ecommerce/ui/screens/signin_screen.dart';
import 'package:ecommerce/ui/screens/signin_with_email.dart';
import 'package:ecommerce/ui/screens/splash_screen.dart';
import 'package:ecommerce/ui/screens/terms_and_conditions_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configLoading();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          elevation: 0,
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black54),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      initialRoute: OnBoardingScreen.routeName,
      routes: {
        '/': (context) => const MainScreen(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        ProductsScreen.routeName: (context) => const ProductsScreen(),
        ProductDetailScreen.routeName: (context) => const ProductDetailScreen(),
        SignInScreen.routeName: (context) => const SignInScreen(),
        SignUpScreen.routeName: (context) => const SignUpScreen(),
        NotificationsScreen.routeName: (context) => const NotificationsScreen(),
        NotificationDetailScreen.routeName: (context) =>
            const NotificationDetailScreen(),
        TermsAndConditionsScreen.routeName: (context) =>
            const TermsAndConditionsScreen(),
        PrivacyPolicyScreen.routeName: (context) => const PrivacyPolicyScreen(),
        OTPScreen.routeName: (context) => const OTPScreen(),
        OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
        CartScreen.routeName: (context) => const CartScreen(),
        SignInWithEmail.routeName: (context) => const SignInWithEmail(),
        AddressesScreen.routeName: (context) => const AddressesScreen(),
        AddressFormScreen.routeName: (context) => const AddressFormScreen(),
        OrdersScreen.routeName: (context) => const OrdersScreen(),
        OrderDetailScreen.routeName: (context) => const OrderDetailScreen(),
      },
    );
  }
}
