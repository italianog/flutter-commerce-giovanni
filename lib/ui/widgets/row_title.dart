import 'package:flutter/material.dart';

class RowTitle extends StatelessWidget {
  const RowTitle({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Row(
              children: const [
                Text(
                  'Scopri tutti',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Icon(Icons.chevron_right),
              ],
            )
          ],
        ),
      ),
    );
  }
}
