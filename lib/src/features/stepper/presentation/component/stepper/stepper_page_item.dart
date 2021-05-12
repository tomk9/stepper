import 'package:flutter/material.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/component_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/form_builder_component_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/static_component_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/submit_component_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/text_component_entity.dart';
import 'package:stepper/src/features/stepper/presentation/component/stepper/component/form_builder_component.dart';
import 'package:stepper/src/features/stepper/presentation/component/stepper/component/static_component.dart';
import 'package:stepper/src/features/stepper/presentation/component/stepper/component/submit_component.dart';
import 'package:stepper/src/features/stepper/presentation/component/stepper/component/text_component.dart';
import 'package:stepper/src/features/stepper/presentation/component/stepper/component/unknown_component.dart';

class StepperPageItem extends StatelessWidget {
  const StepperPageItem({
    Key? key,
    required this.component,
  }) : super(key: key);

  final ComponentEntity component;

  @override
  Widget build(BuildContext context) {
    if (component is StaticComponentEntity) {
      return StaticComponent(
        staticComponentEntity: component as StaticComponentEntity,
      );
    } else if (component is TextComponentEntity) {
      return TextComponent(
        textComponentEntity: component as TextComponentEntity,
      );
    } else if (component is FormBuilderComponentEntity) {
      return FormBuilderComponent(
        formBuilderComponentEntity: component as FormBuilderComponentEntity,
      );
    } else if (component is SubmitComponentEntity) {
      return SubmitComponent(
        submitComponentEntity: component as SubmitComponentEntity,
      );
    }
    return const UnknownComponent();
  }
}
