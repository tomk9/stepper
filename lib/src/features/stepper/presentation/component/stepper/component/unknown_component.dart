import 'package:flutter/material.dart';

class UnknownComponent extends StatelessWidget {
  const UnknownComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Unknown component',
      ),
    );
  }
}
