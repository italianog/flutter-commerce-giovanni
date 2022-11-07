import 'dart:io';
import 'package:ecommerce/providers/theme_provider.dart';
import 'package:ecommerce/ui/screens/address_form_screen.dart';
import 'package:ecommerce/ui/screens/addresses_screen.dart';
import 'package:ecommerce/ui/screens/cart_screen.dart';
import 'package:ecommerce/ui/screens/change_password.dart';
import 'package:ecommerce/ui/screens/edit_profile.dart';
import 'package:ecommerce/ui/screens/favorites_screen.dart';
import 'package:ecommerce/ui/screens/main_screen.dart';
import 'package:ecommerce/ui/screens/notification_detail_screen.dart';
import 'package:ecommerce/ui/screens/notifications_screen.dart';
import 'package:ecommerce/ui/screens/onboarding_screen.dart';
import 'package:ecommerce/ui/screens/order_detail_screen.dart';
import 'package:ecommerce/ui/screens/order_result_screen.dart';
import 'package:ecommerce/ui/screens/orders_screen.dart';
import 'package:ecommerce/ui/screens/otp_screen.dart';
import 'package:ecommerce/ui/screens/privacy_policy_screen.dart';
import 'package:ecommerce/ui/screens/product_detail_screen.dart';
import 'package:ecommerce/ui/screens/products/products_main.dart';
import 'package:ecommerce/ui/screens/products/products_on_sale.dart';
import 'package:ecommerce/ui/screens/settings_screen.dart';
import 'package:ecommerce/ui/screens/sign_up_screen.dart';
import 'package:ecommerce/ui/screens/signin_screen.dart';
import 'package:ecommerce/ui/screens/signin_with_email.dart';
import 'package:ecommerce/ui/screens/splash_screen.dart';
import 'package:ecommerce/ui/screens/terms_and_conditions_screen.dart';
import 'package:ecommerce/ui/screens/test_screen.dart';
import 'package:ecommerce/ui/theme/app_colors.dart';
import 'package:ecommerce/utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'firebase_messaging_utils.dart';
import 'firebase_options.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  ///Background Handler

  print("Handling a background message: ${message.messageId}");
  print(message.notification?.title);
  print(message.notification?.body);
}

void initFirebaseMessaging() {
  requestNotificationsPermission();

  ///Foreground Handler
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });
}

Future<void> getFirebaseToken() async {
  FirebaseMessaging.instance.getToken().then((value) {
    const FlutterSecureStorage().write(key: 'fcm_token', value: value);
  });
}

Future<void> main() async {
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: AppColors.backgroundGrey),
    );
  }
  WidgetsFlutterBinding.ensureInitialized();
  configLoading();
  await Firebase.initializeApp(
    name: 'name-here',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  initFirebaseMessaging();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      theme: ref.watch(themeProvider),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
      initialRoute: SplashScreen.routeName,
      themeMode: ThemeMode.light,
      routes: {
        MainScreen.routeName: (context) => const MainScreen(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        FavoritesScreen.routeName: (context) => const FavoritesScreen(),
        ProductDetailScreen.routeName: (context) => const ProductDetailScreen(),
        ProductsOnSale.routeName: (context) => const ProductsOnSale(),
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
        OrderResultScreen.routeName: (context) => const OrderResultScreen(),
        EditProfile.routeName: (context) => const EditProfile(),
        ProductsMain.routeName: (context) => const ProductsMain(),
        ChangePassword.routeName: (context) => const ChangePassword(),
        SettingsScreen.routeName: (context) => const SettingsScreen(),
        TestScreen.routeName: (context) => const TestScreen(),
      },
    );
  }
}
