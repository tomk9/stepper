import 'package:stepper/src/features/stepper/data/model/component/component_model.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/component_entity.dart';

class TextComponentEntity extends ComponentEntity {
  const TextComponentEntity({
    required this.id,
    required this.text,
  }) : super(id: id);

  @override
  final String id;
  final String text;

  TextComponentEntity.fromModel(
    ComponentModel componentModel,
  ) : this(
          id: componentModel.id,
          text: componentModel.props?.text ?? '',
        );
}
