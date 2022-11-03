import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.onChanged,
    required this.controller,
    this.onDelete,
  }) : super(key: key);
  final void Function(String? value) onChanged;
  final VoidCallback? onDelete;
  final TextEditingController controller;

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
          controller: controller,
          onChanged: onChanged,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.black54,
            ),
            suffixIcon: IconButton(
              onPressed: onDelete,
              icon: const Icon(
                Icons.close,
                color: Colors.black54,
              ),
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
