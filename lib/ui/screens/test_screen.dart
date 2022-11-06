import 'package:ecommerce/ui/widgets/buttons/primary_buttons.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);
  static const routeName = '/test-screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            PrimaryButton(onTap: () {}, text: 'Apri snackbar alta'),
          ],
        ),
      ),
    );
  }
}
