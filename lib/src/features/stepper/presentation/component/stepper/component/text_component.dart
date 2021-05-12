import 'package:flutter/material.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/text_component_entity.dart';

class TextComponent extends StatelessWidget {
  const TextComponent({
    Key? key,
    required this.textComponentEntity,
  }) : super(key: key);

  final TextComponentEntity textComponentEntity;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Visibility(
        visible: textComponentEntity.visible,
        child: Text(
          textComponentEntity.text,
        ),
      ),
    );
  }
}
