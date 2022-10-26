import 'package:flutter/material.dart';

class CartTile extends StatefulWidget {
  const CartTile({Key? key}) : super(key: key);

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Row(),
          )
        ],
      ),
    );
  }
}
