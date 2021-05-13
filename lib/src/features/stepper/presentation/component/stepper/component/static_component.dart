import 'package:flutter/material.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/static_component_entity.dart';
import 'package:stepper/src/features/stepper/presentation/component/stepper/forward_button.dart';

class StaticComponent extends StatelessWidget {
  const StaticComponent({
    Key? key,
    required this.staticComponentEntity,
    required this.pageController,
  }) : super(key: key);

  final StaticComponentEntity staticComponentEntity;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          child: Center(
            child: FlutterLogo(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: ForwardButton(
            onPressed: _onPressed,
          ),
        ),
      ],
    );
  }

  void _onPressed() {
    pageController.nextPage(
      duration: kThemeAnimationDuration,
      curve: Curves.easeInOut,
    );
  }
}
