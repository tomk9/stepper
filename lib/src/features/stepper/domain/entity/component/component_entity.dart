import 'package:equatable/equatable.dart';
import 'package:stepper/src/features/stepper/data/model/component/component_model.dart';
import 'package:stepper/src/features/stepper/data/model/component/component_type/component_type.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/form_builder_component_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/static_component_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/submit_component_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/text_component_entity.dart';

class ComponentEntity extends Equatable {
  const ComponentEntity({
    required this.id,
  });

  final String id;

  factory ComponentEntity.fromModel(
    ComponentModel componentModel,
  ) {
    switch (componentModel.type) {
      case ComponentType.staticComponentOne:
        return StaticComponentEntity.fromModel(componentModel);
      case ComponentType.textComponent:
        return TextComponentEntity.fromModel(componentModel);
      case ComponentType.formBuilderComponent:
        return FormBuilderComponentEntity.fromModel(componentModel);
      case ComponentType.submitComponent:
        return SubmitComponentEntity.fromModel(componentModel);
    }
  }

  @override
  List<Object?> get props => [id];
}
