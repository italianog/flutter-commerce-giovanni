import 'package:ecommerce/ui/screens/signin_with_email.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FacebookLoginButton extends StatefulWidget {
  const FacebookLoginButton({Key? key}) : super(key: key);

  @override
  State<FacebookLoginButton> createState() => _FacebookLoginButtonState();
}

class _FacebookLoginButtonState extends State<FacebookLoginButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.blue,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      onPressed: () {},
      child: isLoading
          ? const Center(
              child: SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            )
          : Row(
              children: const [
                FaIcon(
                  FontAwesomeIcons.facebook,
                  color: Colors.white,
                ),
                Spacer(),
                Text(
                  'Login with Facebook',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ],
            ),
    );
  }
}

class AppleLoginButton extends StatelessWidget {
  const AppleLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      onPressed: () {},
      child: Row(
        children: const [
          FaIcon(
            FontAwesomeIcons.apple,
            color: Colors.white,
          ),
          Spacer(),
          Text(
            'Login with Apple',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.redAccent,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      onPressed: () {},
      child: Row(
        children: const [
          FaIcon(
            FontAwesomeIcons.google,
            color: Colors.white,
          ),
          Spacer(),
          Text(
            'Login with Google',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class EmailLogin extends StatelessWidget {
  const EmailLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      onPressed: () {
        Navigator.of(context).pushNamed(SignInWithEmail.routeName);
      },
      child: Row(
        children: const [
          Icon(
            Icons.mail,
            size: 26,
          ),
          Spacer(),
          Text(
            'Login with Email',
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
