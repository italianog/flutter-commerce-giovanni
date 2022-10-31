import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  const NoData({
    Key? key,
    this.text,
  }) : super(key: key);
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      child: Center(
        child: Text(
          text ?? 'Non ci sono elementi in questa sezione',
        ),
      ),
    );
  }
}
