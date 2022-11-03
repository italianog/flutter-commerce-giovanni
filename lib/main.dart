import 'package:ecommerce/providers/theme_provider.dart';
import 'package:ecommerce/ui/screens/address_form_screen.dart';
import 'package:ecommerce/ui/screens/addresses_screen.dart';
import 'package:ecommerce/ui/screens/cart_screen.dart';
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
import 'package:ecommerce/ui/screens/products_main.dart';
import 'package:ecommerce/ui/screens/sign_up_screen.dart';
import 'package:ecommerce/ui/screens/signin_screen.dart';
import 'package:ecommerce/ui/screens/signin_with_email.dart';
import 'package:ecommerce/ui/screens/splash_screen.dart';
import 'package:ecommerce/ui/screens/terms_and_conditions_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configLoading();
  //requestNotificationsPermission();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
/*
  await FirebaseMessaging.instance.getInitialMessage();
  getFirebaseToken();
  initPlatformState();
  initNotifications();
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      importance: Importance.max,
    );
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    // If `onMessage` is triggered with a notification, construct our own
    // local notification to show to users using the created channel.
    if (notification != null && android != null) {}
  });
*/

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

void initNotifications() {
  const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
  const initializationSettings = InitializationSettings(
    android: androidSettings,
    iOS: DarwinInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification),
  );
  FlutterLocalNotificationsPlugin().initialize(initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
}

Future<void> requestNotificationsPermission() async {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  NotificationSettings notificationSetting =
      await firebaseMessaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    sound: true,
  );

  switch (notificationSetting.authorizationStatus) {
    case (AuthorizationStatus.authorized):
      print('granted');
      break;
    default:
      print('not granted');
      break;
  }
}

Future<void> getFirebaseToken() async {
  FirebaseMessaging.instance.getToken().then((value) {
    print(value);
  });
}

void onDidReceiveLocalNotification(
    int id, String? title, String? body, String? payload) {
  print(title);
  print(body);
}

void onDidReceiveNotificationResponse(NotificationResponse details) {}

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

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      theme: ref.read(themeProvider),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
      initialRoute: SplashScreen.routeName,
      themeMode: ThemeMode.light,
      routes: {
        MainScreen.routeName: (context) => const MainScreen(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        FavoritesScreen.routeName: (context) => const FavoritesScreen(),
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
        OrderResultScreen.routeName: (context) => const OrderResultScreen(),
        EditProfile.routeName: (context) => const EditProfile(),
        ProductsMain.routeName: (context) => const ProductsMain()
      },
    );
  }
}
