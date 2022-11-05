import 'package:ecommerce/fakedb/db.dart';
import 'package:ecommerce/ui/widgets/search/search_bar.dart';
import 'package:flutter/material.dart';

import '../../../../models/product.dart';
import '../../../widgets/products/item_grid_tile.dart';

class PaniniTab extends StatefulWidget {
  const PaniniTab({Key? key}) : super(key: key);

  @override
  State<PaniniTab> createState() => _PaniniTabState();
}

class _PaniniTabState extends State<PaniniTab> {
  String? _filterName;
  List<Product> _products = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _products = FakeDB.getProductsByCategory(category: 'panini');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Column(
        children: [
          SearchBar(
            controller: _controller,
            onDelete: () {
              _filterName = null;
              _products = FakeDB.getProductsByCategory(category: 'panini');
              _controller.clear();
              setState(() {});
            },
            onChanged: (value) {
              setState(() {
                if (value != null && value.isEmpty) {
                  _products = FakeDB.getProductsByCategory(category: 'panini');
                } else {
                  _filterName = value;
                  _products = _products
                      .where((element) => element.name
                          .toLowerCase()
                          .contains(_filterName!.toLowerCase()))
                      .toList();
                }
              });
            },
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 32,
                mainAxisExtent: 250, // <== change the height to fit your needs
              ),
              itemCount: _products.length,
              itemBuilder: (context, index) {
                return ItemGridTile(
                  product: _products[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
