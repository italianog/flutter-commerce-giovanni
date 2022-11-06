import 'package:ecommerce/fakedb/db.dart';
import 'package:ecommerce/ui/theme/app_colors.dart';
import 'package:ecommerce/ui/widgets/buttons/primary_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../models/order.dart';
import '../utils/utils.dart';

class OrderDetailScreen extends ConsumerStatefulWidget {
  const OrderDetailScreen({
    Key? key,
  }) : super(key: key);

  static const routeName = '/order-detail-screen';

  @override
  ConsumerState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends ConsumerState<OrderDetailScreen> {
  Order? _order;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _order = ModalRoute.of(context)?.settings.arguments as Order;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return _order != null
        ? Scaffold(
            appBar: AppBar(
              title: const Text('Ordine'),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        'Ordine del ${dateFormat.format(_order!.createdAt)}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  AppShadows.defaultShadow,
                                ],
                              ),
                              child: ListTile(
                                trailing: Text(
                                    'x ${_order!.products[index].quantity}'),
                                contentPadding: const EdgeInsets.all(16),
                                tileColor: Colors.white,
                                leading: SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Image.asset(
                                    _order!.products[index].product.image,
                                  ),
                                ),
                                title:
                                    Text(_order!.products[index].product.name),
                                subtitle: Text(
                                  NumberFormat.currency(
                                          locale: 'it',
                                          symbol: '€',
                                          decimalDigits: 2)
                                      .format(_order!
                                          .products[index].product.price),
                                ),
                              ),
                            ),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 16,
                            ),
                        itemCount: _order!.products.length),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.zero,
                      child: Row(
                        children: [
                          const Text(
                            'Totale',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          Text(
                            NumberFormat.currency(
                                    locale: 'it', symbol: '€', decimalDigits: 2)
                                .format(
                              FakeDB().getTotalFromOrder(_order!),
                            ),
                            style: const TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    PrimaryButton(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            isDismissible: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(15)),
                            ),
                            builder: (context) => DraggableScrollableSheet(
                              initialChildSize: 0.3,
                              minChildSize: 0.2,
                              maxChildSize: 0.8,
                              expand: false,
                              builder: (context, scrollController) => SafeArea(
                                child: ListView(
                                  controller: scrollController,
                                  children: [
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    ListTile(
                                      leading: const Icon(
                                          Icons.phone_android_outlined),
                                      title:
                                          const Text('Chiama al nostro numero'),
                                      onTap: () async {
                                        Navigator.pop(context);
                                        String telephoneNumber =
                                            '+2347012345678';
                                        String smsUrl = "tel:$telephoneNumber";
                                        if (await canLaunchUrlString(smsUrl)) {
                                          await launchUrlString(smsUrl);
                                        } else {
                                          throw "Error occured trying to send a message that number.";
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.mail),
                                      title: const Text(
                                          'Scrivi una mail al nostro team'),
                                      onTap: () async {
                                        Navigator.pop(context);
                                        final Uri params = Uri(
                                          scheme: 'mailto',
                                          path: 'email@example.com',
                                          query:
                                              'subject=App Feedback&body=App Version 3.23', //add subject and body here
                                        );

                                        var url = params.toString();
                                        if (await canLaunchUrlString(url)) {
                                          await launchUrlString(url);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        text: 'Contattaci')
                  ],
                ),
              ),
            ),
          )
        : Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ),
          );
  }
}
