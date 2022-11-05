import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/ui/theme/app_colors.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddressFormScreen.routeName);
        },
        backgroundColor: AppColors.primaryColor,
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
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('addresses')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                    return ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final Address address = Address.fromMap(
                            snapshot.data!.docs[index].data(),
                            snapshot.data!.docs[index].id,
                          );

                          return ListTile(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  AddressFormScreen.routeName,
                                  arguments: address);
                            },
                            title: Text(address.address),
                            subtitle: Text(address.city),
                            trailing: const Icon(Icons.chevron_right),
                            tileColor: Colors.white,
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 8,
                            ),
                        itemCount: snapshot.data!.docs.length);
                  } else if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                    return Container(
                      margin: const EdgeInsets.only(top: 32),
                      child: const Center(
                        child: Text(
                          'Non sono ancora stati inseriti indirizzi',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Container(
                      margin: const EdgeInsets.only(top: 32),
                      child: const Center(
                        child: Text(
                          'Si è verificato un errore',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
