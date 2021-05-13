import 'package:flutter/material.dart';

class ForwardButton extends StatelessWidget {
  const ForwardButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        Icons.forward,
      ),
      label: Text(
        'Next',
      ),
    );
  }
}
