import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/address.dart';
import 'address_form_screen.dart';

class AddressesScreen extends ConsumerStatefulWidget {
  const AddressesScreen({
    Key? key,
  }) : super(key: key);
  static const routeName = '/addresses-screen';

  @override
  ConsumerState createState() => _AddressesScreenState();
}

class _AddressesScreenState extends ConsumerState<AddressesScreen> {
  final List<Address> _addresses = [
    Address(address: 'Via Prova', postalCode: '98050', city: 'Milazzo'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddressFormScreen.routeName);
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Indirizzi'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => ListTile(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            AddressFormScreen.routeName,
                            arguments: _addresses[index]);
                      },
                      title: Text(_addresses[index].address),
                      subtitle: Text(_addresses[index].city),
                      trailing: const Icon(Icons.chevron_right),
                      tileColor: Colors.white,
                    ),
                separatorBuilder: (context, index) => const SizedBox(),
                itemCount: _addresses.length),
          ],
        ),
      ),
    );
  }
}
