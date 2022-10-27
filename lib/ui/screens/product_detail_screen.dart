import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../models/product.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);
  static const routeName = '/product-detail-screen';

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  late Product _product;
  final bool _showMore = false;
  String? _selectedSize;
  String? _selectedColor;
  int _selectedQty = 1;
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _product = ModalRoute.of(context)!.settings.arguments as Product;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prodotto'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.4),
                child: CachedNetworkImage(
                  width: double.infinity,
                  imageUrl: _product.image,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
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
                  Text(
                    NumberFormat.currency(
                            locale: 'it', symbol: '€', decimalDigits: 2)
                        .format(_product?.price),
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Al contrario di quanto si pensi, Lorem Ipsum non è semplicemente una sequenza casuale di caratteri. Risale ad un classico della letteratura latina del 45 AC, cosa che lo rende vecchio di 2000 anni. Richard McClintock, professore di latino al Hampden-Sydney College in Virginia, ha ricercato una delle più oscure parole latine, consectetur, da un passaggio del Lorem Ipsum e ha scoperto tra i vari testi in cui è citata, la fonte da cui è tratto il testo, le sezioni 1.10.32 and 1.10.33 del "de Finibus Bonorum et Malorum" di Cicerone. Questo testo è un trattato su teorie di etica, molto popolare nel Rinascimento. La prima riga del Lorem Ipsum, "Lorem ipsum dolor sit amet..", è tratta da un passaggio della sezione 1.10.32.',
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
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 50,
              child: SizeBoxes(
                onSelected: (value) {
                  _selectedSize = value;
                },
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 50,
              child: ColorBoxes(
                onSelected: (value) {
                  setState(() {
                    _selectedColor = value;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 32,
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
                    child: MaterialButton(
                      color: Colors.black,
                      child: const Text(
                        'Acquista adesso',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      onPressed: () {
                        ref
                            .read(cartProvider.notifier)
                            .addProductToCart(CartProduct(
                              name: _product.name,
                              id: _product.id,
                              price: _product.price,
                              isAvailable: _product.isAvailable,
                              availableQuantity: _product.availableQuantity,
                              image: _product.image,
                            ));
                        var snackBar = SnackBar(
                          content: Text(
                              'Hai aggiunto al carrello: ${_product?.name}'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        print('$_selectedSize $_selectedColor $_selectedQty');
                        ;
                      },
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 64,
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
