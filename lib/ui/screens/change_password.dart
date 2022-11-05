import 'package:ecommerce/ui/widgets/buttons/primary_buttons.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  static const routeName = '/change-password';

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, TextEditingController> _controllers = {
    'oldPassword': TextEditingController(),
    'newPassword': TextEditingController(),
    'confirm': TextEditingController(),
  };

  bool _hideNewPassword = true;
  bool _hideOldPassword = true;
  bool _hideConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modifica password'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _controllers['oldPassword'],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Errore inserire una password';
                  } else if (value.isNotEmpty && value.length < 6) {
                    return 'La password inserita è troppo corta, min 6 caratteri';
                  }
                  return null;
                },
                obscureText: _hideOldPassword,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: _hideOldPassword
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _hideOldPassword = !_hideOldPassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _controllers['newPassword'],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Errore inserire una password';
                  } else if (value.isNotEmpty && value.length < 6) {
                    return 'La password inserita è troppo corta, min 6 caratteri';
                  }
                  return null;
                },
                obscureText: _hideNewPassword,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(),
                  labelText: 'Nuova password',
                  suffixIcon: IconButton(
                    icon: _hideNewPassword
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _hideNewPassword = !_hideNewPassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _controllers['confirm'],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Errore inserire una password';
                  } else if (value.isNotEmpty && value.length < 6) {
                    return 'La password inserita è troppo corta, min 6 caratteri';
                  }
                  return null;
                },
                obscureText: _hideConfirm,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(),
                  labelText: 'Conferma nuova password',
                  suffixIcon: IconButton(
                    icon: _hideConfirm
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _hideConfirm = !_hideConfirm;
                      });
                    },
                  ),
                ),
              ),
              const Spacer(),
              PrimaryButton(
                  onTap: () {
                    _formKey.currentState!.validate();
                  },
                  text: 'Modifica'),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
