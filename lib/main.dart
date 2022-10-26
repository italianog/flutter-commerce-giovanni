import 'package:ecommerce/ui/screens/cart_screen.dart';
import 'package:ecommerce/ui/screens/main_screen.dart';
import 'package:ecommerce/ui/screens/notification_detail_screen.dart';
import 'package:ecommerce/ui/screens/notifications_screen.dart';
import 'package:ecommerce/ui/screens/onboarding_screen.dart';
import 'package:ecommerce/ui/screens/otp_screen.dart';
import 'package:ecommerce/ui/screens/privacy_policy_screen.dart';
import 'package:ecommerce/ui/screens/product_detail_screen.dart';
import 'package:ecommerce/ui/screens/products_screen.dart';
import 'package:ecommerce/ui/screens/sign_up_screen.dart';
import 'package:ecommerce/ui/screens/signin_screen.dart';
import 'package:ecommerce/ui/screens/signin_with_email.dart';
import 'package:ecommerce/ui/screens/terms_and_conditions_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          elevation: 0,
          color: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black54),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
      ),
      initialRoute: OnBoardingScreen.routeName,
      routes: {
        '/': (context) => const MainScreen(),
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
      },
    );
  }
}
