import 'package:ecommerce/providers/auth_provider.dart';
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
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      tryLogin();
                    }
                  },
                  color: Colors.blue,
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
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
    Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
  }
}
