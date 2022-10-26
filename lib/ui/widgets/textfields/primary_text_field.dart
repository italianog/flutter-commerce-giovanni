import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        onChanged: (value) {
          print(value);
        },
        cursorColor: Colors.black,
        decoration: const InputDecoration(
          hintText: 'Suggerimento',
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
