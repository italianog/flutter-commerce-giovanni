import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/buttons/social_buttons.dart';
import '../widgets/textfields/primary_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  static String routeName = '/sign-in-screen';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffbdc3c7),
              Color(0xff2c3e50),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/logo.svg',
              width: 120,
            ),
            const SizedBox(
              height: 200,
            ),
            const FacebookLoginButton(),
            const SizedBox(
              height: 20,
            ),
            const AppleLoginButton(),
            const SizedBox(
              height: 20,
            ),
            const GoogleLoginButton(),
            const SizedBox(
              height: 20,
            ),
            const EmailLogin(),
          ],
        ),
      ),
    );
  }
}
