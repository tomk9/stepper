import 'package:flutter/material.dart';
import 'package:stepper/src/common/presentation/component/keyboard/keyboard_dismiss_wrapper.dart';
import 'package:stepper/src/features/stepper/presentation/page/stepper_page.dart';

class StepperMaterialApp extends StatelessWidget {
  const StepperMaterialApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stepper',
      builder: _builder,
      home: const StepperPage(),
    );
  }

  Widget _builder(BuildContext context, Widget? child) {
    return KeyboardDismissWrapper(
      child: child,
    );
  }
}
