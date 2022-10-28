import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/address.dart';

class AddressFormScreen extends ConsumerStatefulWidget {
  const AddressFormScreen({
    Key? key,
  }) : super(key: key);
  static const routeName = 'address-form-screen';

  @override
  ConsumerState createState() => _AddressFormScreenState();
}

class _AddressFormScreenState extends ConsumerState<AddressFormScreen> {
  final _formKey = GlobalKey<FormState>();
  bool edit = false;
  Address? _address;
  final Map<String, TextEditingController> _controllers = {
    'city': TextEditingController(),
    'address': TextEditingController(),
    'cap': TextEditingController(),
  };

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _address = ModalRoute.of(context)?.settings.arguments as Address?;
        if (_address != null) edit = true;
        _controllers['city']?.text = _address?.city ?? '';
        _controllers['address']?.text = _address?.address ?? '';
        _controllers['cap']?.text = _address?.postalCode ?? '';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Indirizzo'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _controllers['address'],
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Indirizzo'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Si prega di inserire un indirizzo valido';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _controllers['city'],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Si prega di inserire una città valida';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Città'),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _controllers['cap'],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Si prega inserire un CAP valido';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Cap'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.validate();
                    },
                    child: Text(edit ? 'Modifica' : 'Conferma'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
