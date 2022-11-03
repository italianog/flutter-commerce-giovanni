import 'package:ecommerce/providers/auth_provider.dart';
import 'package:ecommerce/ui/screens/sign_up_screen.dart';
import 'package:ecommerce/ui/widgets/buttons/primary_buttons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInWithEmail extends ConsumerStatefulWidget {
  const SignInWithEmail({Key? key}) : super(key: key);

  static const routeName = 'sign-in-with-email-screen';

  @override
  ConsumerState<SignInWithEmail> createState() => _SignInWithEmailState();
}

class _SignInWithEmailState extends ConsumerState<SignInWithEmail> {
  bool _hidePassword = true;
  final _formKey = GlobalKey<FormState>();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
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
                    return 'Errore password';
                  } else if (value.isNotEmpty && value.length < 6) {
                    'La lunghezza minima della password è 6 caratteri';
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
                height: 8,
              ),
              GestureDetector(
                onTap: () {
                  //TODO screen recupera password
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      'Password dimenticata?',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              RichText(
                text: TextSpan(
                    text: 'Non hai ancora un account? ',
                    style: const TextStyle(color: Colors.black87),
                    children: [
                      TextSpan(
                        text: 'Registrati',
                        style: const TextStyle(
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigator.of(context).pushNamedAndRemoveUntil(
                            //     SignUpScreen.routeName, (route) => false);
                            Navigator.of(context)
                                .pushNamed(SignUpScreen.routeName);
                          },
                      )
                    ]),
              ),
              const Spacer(),
              PrimaryButton(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    tryLogin();
                  }
                },
                text: 'Login',
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> tryLogin() async {
    final value = await ref.read(authProvider.notifier).login(
          _controllers['email']!.text,
          _controllers['password']!.text,
        );
    if (value == false) {
      const snackBar = SnackBar(
        content: Text('Credenziali non valide'),
      );
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      if (!mounted) return;
      Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
    }
  }
}
