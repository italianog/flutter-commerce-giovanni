import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton({Key? key, required this.onTap, required this.isLoading})
      : super(key: key);

  final VoidCallback onTap;
  final bool isLoading;

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      /*   style: ButtonStyle(
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 10))),*/
      onPressed: () {},
      child: widget.isLoading
          ? Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: const Center(
                child: SizedBox(
                  height: 32,
                  width: 32,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
