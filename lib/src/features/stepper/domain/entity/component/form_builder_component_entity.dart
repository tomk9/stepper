import 'package:stepper/src/features/stepper/data/model/component/component_model.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/component_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/field_entity.dart';

class FormBuilderComponentEntity extends ComponentEntity {
  const FormBuilderComponentEntity({
    required this.id,
    required this.fields,
  }) : super(id: id);

  @override
  final String id;
  final List<FieldEntity> fields;

  FormBuilderComponentEntity.fromModel(
    ComponentModel componentModel,
  ) : this(
          id: componentModel.id,
          fields: componentModel.componentProps?.fields
                  ?.map(
                    (e) => FieldEntity.fromModel(e),
                  )
                  .toList() ??
              [],
        );

  @override
  List<Object?> get props => [id, fields];
}
