import 'dart:math';

import 'package:ecommerce/fakedb/db.dart';
import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/providers/navigation_provider.dart';
import 'package:ecommerce/ui/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../models/product.dart';
import '../widgets/buttons/primary_buttons.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);
  static const routeName = '/product-detail-screen';

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  Product? _product;
  final bool _showMore = false;
  int _selectedQty = 1;
  bool _isFavorite = false;
  String value = '0';
  int randomNumber = 0;

  @override
  void initState() {
    super.initState();
    Random random = Random();
    randomNumber = random.nextInt(100);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _product = ModalRoute.of(context)!.settings.arguments as Product;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: PrimaryButton(
                onTap: () {
                  ref.read(navigationProvider.notifier).changePage(2);
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      MainScreen.routeName, (route) => false);
                },
                text: 'Vai al checkout',
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            const SizedBox(
              width: 4,
            ),
          ],
        ),
      ],
      appBar: AppBar(
        title: const Text('Prodotto'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            if (_product != null)
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.8,
                      maxHeight: MediaQuery.of(context).size.height * 0.4),
                  child: Image.asset(
                    _product!.image,
                    width: double.infinity,
                  ),
                ),
              ),
            const SizedBox(
              height: 16,
            ),
            if (_product?.category == 'bibite')
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  spacing: 8,
                  children: [
                    Chip(
                        backgroundColor: Colors.green[400],
                        label: const Text(
                          'Vegano',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        )),
                    const Chip(
                        backgroundColor: Colors.orangeAccent,
                        label: Text(
                          'Gluten Free',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        )),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      _product?.name ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  if (_product != null)
                    Text(
                      NumberFormat.currency(
                              locale: 'it', symbol: '€', decimalDigits: 2)
                          .format(
                              _product?.promotionalPrice ?? _product?.price),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  if (_product != null && _product?.rating != null)
                    RatingBarIndicator(
                      rating: _product!.rating,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 30.0,
                      unratedColor: Colors.amber.withAlpha(50),
                      direction: Axis.horizontal,
                    ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text('($randomNumber)')
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                _product?.description ?? '',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SelectQuantity(
              onChanged: (value) {
                setState(() {
                  _selectedQty = value;
                });
              },
            ),
            /*   const SizedBox(
              height: 16,
            ),
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => RadioListTile<Bibite>(
                      title: const Text('Cocacola'),
                      value: Bibite.cocacola,
                      groupValue: _bibite,
                      onChanged: (Bibite? value) {
                        setState(() {
                          _bibite = value;
                        });
                      },
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 12,
                    ),
                itemCount: 1),*/
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: IconButton(
                      icon: Icon(
                        _isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: _isFavorite ? Colors.red : Colors.grey[400],
                      ),
                      onPressed: () {
                        setState(() {
                          _isFavorite = !_isFavorite;
                          if (_isFavorite) {
                            var snackBar = SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                  'Hai aggiunto ai preferiti: ${_product?.name}'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            var snackBar = SnackBar(
                              backgroundColor: Colors.purple,
                              content: Text(
                                  'Hai rimosso dai preferiti: ${_product?.name}'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                          //TODO CALL API
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 8,
                    child: _product?.availableQuantity != 0
                        ? MaterialButton(
                            color: Colors.black,
                            child: const Text(
                              'Acquista adesso',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {
                              ref.read(cartProvider.notifier).addProductToCart(
                                    product: _product!,
                                    quantity: _selectedQty,
                                  );
                              var snackBar = SnackBar(
                                content: Text(
                                    'Hai aggiunto al carrello: ${_product?.name}'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                          )
                        : Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: const Text(
                              'Spiacente questo prodotto non è attualmente disponibile',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 120,
            ),
          ],
        ),
      ),
    );
  }
}

class SizeBoxes extends StatefulWidget {
  const SizeBoxes({
    Key? key,
    required this.onSelected,
  }) : super(key: key);

  final Function(String value) onSelected;

  @override
  State<SizeBoxes> createState() => _SizeBoxesState();
}

class _SizeBoxesState extends State<SizeBoxes> {
  @override
  void initState() {
    super.initState();
    widget.onSelected(_sizes[0]);
  }

  final List<String> _sizes = ['XS', 'S', 'M', 'L', 'XL'];
  int _activeBox = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
              onTap: () {
                widget.onSelected(_sizes[index]);
                setState(() {
                  _activeBox = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: index == _activeBox ? Colors.black : Colors.white,
                ),
                child: Center(
                    child: Text(
                  _sizes[index],
                  style: TextStyle(
                      color: index == _activeBox ? Colors.white : Colors.black),
                )),
              ),
            ),
        separatorBuilder: (context, index) => const SizedBox(
              width: 16,
            ),
        itemCount: _sizes.length);
  }
}

class ColorBoxes extends StatefulWidget {
  const ColorBoxes({
    Key? key,
    required this.onSelected,
  }) : super(key: key);

  final Function(String value) onSelected;

  @override
  State<ColorBoxes> createState() => _ColorBoxesState();
}

class _ColorBoxesState extends State<ColorBoxes> {
  @override
  void initState() {
    super.initState();
  }

  final List<Color> _colors = [Colors.amber, Colors.brown, Colors.deepPurple];
  int _activeBox = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
              onTap: () {
                widget.onSelected(_colors[index].toString());
                setState(() {
                  _activeBox = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _colors[index],
                    border: Border.all(
                      color: _activeBox == index
                          ? Colors.black
                          : Colors.transparent,
                      width: 3,
                    )),
              ),
            ),
        separatorBuilder: (context, index) => const SizedBox(
              width: 16,
            ),
        itemCount: _colors.length);
  }
}

class SelectQuantity extends StatefulWidget {
  const SelectQuantity({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  final Function(int value) onChanged;

  @override
  State<SelectQuantity> createState() => _SelectQuantityState();
}

class _SelectQuantityState extends State<SelectQuantity> {
  int _qty = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            if (_qty > 1) {
              setState(() {
                _qty--;
                widget.onChanged(_qty);
              });
            }
          },
          icon: const Icon(Icons.remove_circle_outline),
        ),
        Text('$_qty'),
        IconButton(
          onPressed: () {
            setState(() {
              _qty++;
              widget.onChanged(_qty);
            });
          },
          icon: const Icon(Icons.add_circle_outline),
        )
      ],
    );
  }
}
