import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, required this.onTap, required this.text})
      : super(key: key);

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
          AppColors.primaryColor,
        )),
        onPressed: onTap,
        child: Text(text),
      ),
    );
  }
}
