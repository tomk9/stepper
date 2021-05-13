import 'package:flutter/material.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/text_component_entity.dart';
import 'package:stepper/src/features/stepper/presentation/component/stepper/forward_button.dart';

class TextComponent extends StatelessWidget {
  const TextComponent({
    Key? key,
    required this.textComponentEntity,
    required this.pageController,
  }) : super(key: key);

  final TextComponentEntity textComponentEntity;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Visibility(
              visible: textComponentEntity.visible,
              child: Text(
                textComponentEntity.text,
              ),
            ),
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
