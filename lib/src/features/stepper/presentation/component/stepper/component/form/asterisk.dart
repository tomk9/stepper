import 'package:flutter/material.dart';

class Asterisk extends StatelessWidget {
  const Asterisk({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      '*',
      style: TextStyle(
        color: Colors.red,
      ),
    );
  }
}
