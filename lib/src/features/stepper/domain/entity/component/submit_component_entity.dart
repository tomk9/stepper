import 'package:stepper/src/features/stepper/data/model/component/component_model.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/component_entity.dart';

class SubmitComponentEntity extends ComponentEntity {
  const SubmitComponentEntity({
    required this.id,
  }) : super(id: id);

  @override
  final String id;

  SubmitComponentEntity.fromModel(
    ComponentModel componentModel,
  ) : this(
          id: componentModel.id,
        );
}
