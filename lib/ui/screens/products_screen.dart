import 'package:ecommerce/ui/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../apis/apis.dart';
import '../../models/product.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);
  static String routeName = '/products-screen';

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Product>? _products;
  List<Map<String, bool>> filters = [
    {'Filter_0': false},
    {'Filter_1': false},
    {'Filter_2': false},
  ];
  Future getProducts() async {
    Apis apis = Apis();
    _products = await apis.getProducts();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prodotti'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              color: Colors.blueAccent,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: TextFormField(
                        cursorColor: Colors.black87,
                        decoration: InputDecoration(
                          hintText: 'Cerca tra i prodotti ...',
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.black54,
                          ),
                          contentPadding: const EdgeInsets.all(16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        context: (context),
                        builder: (context) => StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Column(
                            children: [
                              const SizedBox(
                                height: 24,
                              ),
                              Expanded(
                                child: ListView.separated(
                                    itemBuilder: (context, index) =>
                                        CheckboxListTile(
                                            tristate: true,
                                            title: Text(
                                                filters[index].keys.toString()),
                                            value: filters[index]
                                                ['Filter_$index'],
                                            onChanged: (value) {
                                              setState(() {
                                                filters[index]
                                                        ['Filter_$index'] =
                                                    !filters[index]
                                                        ['Filter_$index']!;
                                              });
                                            }),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                          height: 20,
                                        ),
                                    shrinkWrap: true,
                                    itemCount: filters.length),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    //TODO APPLY FILTERS
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Applica'),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      for (var i = 0; i < filters.length; i++) {
                                        filters[i]['Filter_$i'] = false;
                                      }
                                    });

                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cancella filtri'),
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              )
                            ],
                          );
                        }),
                      );
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.filter,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Wrap(
              spacing: 12,
              children: [
                FilterChip(
                  label: const Text('Tutto'),
                  onSelected: (value) {},
                ),
                FilterChip(
                  label: const Text('Tutto'),
                  onSelected: (value) {},
                ),
                FilterChip(
                  label: const Text('Tutto'),
                  onSelected: (value) {},
                ),
                FilterChip(
                  label: const Text('Tutto'),
                  onSelected: (value) {},
                ),
                FilterChip(
                  label: const Text('Tutto'),
                  onSelected: (value) {},
                ),
              ],
            ),
            if (_products != null)
              GridView.builder(
                padding: const EdgeInsets.all(16),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    crossAxisSpacing: 20,
                    childAspectRatio: 1,
                    mainAxisSpacing: 20),
                itemCount: _products!.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Column(
                    children: [
                      InkWell(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          height: 145,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(_products![index].image),
                              fit: BoxFit.contain,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              decoration:
                                  const BoxDecoration(color: Colors.black87),
                              child: Text(
                                _products![index].name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              ProductDetailScreen.routeName,
                              arguments: _products![index]);
                        },
                      ),
                    ],
                  );
                },
              )
            else
              Container(
                margin: const EdgeInsets.only(top: 32),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
          ],
        ),
      ),
    );
  }
}
