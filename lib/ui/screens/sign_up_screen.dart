import 'package:ecommerce/providers/auth_provider.dart';
import 'package:ecommerce/ui/screens/privacy_policy_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static String routeName = '/sign-up-screen';

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _hidePassword = true;
  bool _acceptTerms = false;
  bool _acceptPrivacy = false;

  final Map<String, TextEditingController> _controllers = {
    'email': TextEditingController(),
    'password': TextEditingController(),
  };

  bool _validateEmail(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

  bool _validatePassword(String password) {
    return true;
  }

  bool validateButtons() {
    if (_acceptTerms && _acceptPrivacy) {
      return true;
    }
    const snackBar = SnackBar(
      backgroundColor: Colors.red,
      content: Text(
          'Devi accettare le condizioni e privacy per continuare la registrazione,'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrati'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Inserisci una mail e una password per registrarti sulla nostra app',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 32,
                ),
                TextFormField(
                  controller: _controllers['email'],
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        _validateEmail(value) == false) {
                      return 'Errore email';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    suffixIcon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _controllers['password'],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Errore inserire una password';
                    } else if (value.isNotEmpty && value.length < 6) {
                      return 'La password inserita è troppo corta, min 6 caratteri';
                    }
                    return null;
                  },
                  obscureText: _hidePassword,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(),
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: _hidePassword
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _hidePassword = !_hidePassword;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 64,
                ),
                Semantics(
                  excludeSemantics: true,
                  child: CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      tristate: true,
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _acceptPrivacy,
                      title: RichText(
                        text: TextSpan(
                            text: 'Accetta la privacy ',
                            style: const TextStyle(color: Colors.black87),
                            children: [
                              TextSpan(
                                text: 'Privacy Policy',
                                style: const TextStyle(
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).pushNamed(
                                        PrivacyPolicyScreen.routeName);
                                  },
                              )
                            ]),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _acceptPrivacy = !_acceptPrivacy;
                        });
                      }),
                ),
                const SizedBox(
                  height: 2,
                ),
                Semantics(
                  excludeSemantics: true,
                  child: CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      tristate: true,
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _acceptTerms,
                      title: RichText(
                        text: TextSpan(
                            text: 'Accetta termini e condizioni ',
                            style: const TextStyle(color: Colors.black87),
                            children: [
                              TextSpan(
                                text: 'Termini e condizioni',
                                style: const TextStyle(
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).pushNamed(
                                        PrivacyPolicyScreen.routeName);
                                  },
                              )
                            ]),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _acceptTerms = !_acceptTerms;
                        });
                      }),
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() &&
                          validateButtons()) {
                        trySignUp();
                      }
                    },
                    child: const Text('Registrati'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void trySignUp() async {
    final value = await ref
        .read(authProvider.notifier)
        .signup(_controllers['email']!.text, _controllers['password']!.text);
    if (value == true) {
      Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
    }
  }
}
