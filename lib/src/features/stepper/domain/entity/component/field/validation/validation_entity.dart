import 'package:stepper/src/features/stepper/data/model/component/component_props/field/validation/validation_model.dart';

class ValidationEntity {
  const ValidationEntity({
    required this.required,
  });

  final bool required;

  ValidationEntity.fromModel(
    ValidationModel validationModel,
  ) : this(
          required: validationModel.required,
        );
}
