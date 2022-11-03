import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          AppShadows.defaultShadow,
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: TextField(
          onChanged: (value) {
            print(value);
          },
          textAlignVertical: TextAlignVertical.center,
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black54,
            ),
            hintText: 'Cerca tra i prodotti',
            border: InputBorder.none,
            fillColor: Colors.white,
            filled: true,
          ),
          cursorColor: Colors.black54,
        ),
      ),
    );
  }
}
