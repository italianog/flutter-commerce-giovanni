import 'package:ecommerce/ui/theme/app_colors.dart';
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
      backgroundColor: AppColors.backgroundGrey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/logo.svg',
              width: 120,
            ),
            const SizedBox(
              height: 120,
            ),
            /*       const FacebookLoginButton(),
            const SizedBox(
              height: 20,
            ),
            const AppleLoginButton(),
            const SizedBox(
              height: 20,
            ),*/
            const GoogleLoginButton(),
            const SizedBox(
              height: 20,
            ),
            const EmailLogin(),
            const SizedBox(
              height: 40,
            ),
            const Center(child: Text('oppure')),
            const SizedBox(
              height: 16,
            ),
            const RegisterButton()
          ],
        ),
      ),
    );
  }
}
