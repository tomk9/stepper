import 'package:flutter/material.dart';

class KeyboardDismissWrapper extends StatefulWidget {
  const KeyboardDismissWrapper({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  _KeyboardDismissWrapperState createState() => _KeyboardDismissWrapperState();
}

class _KeyboardDismissWrapperState extends State<KeyboardDismissWrapper> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onDismissKeyboardTap,
      child: widget.child,
    );
  }

  void _onDismissKeyboardTap() {
    final currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
