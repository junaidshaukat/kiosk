import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: const Text('data'),
      onPressed: () {},
    );
  }
}
