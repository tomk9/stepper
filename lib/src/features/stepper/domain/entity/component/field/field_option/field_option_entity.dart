import 'package:equatable/equatable.dart';
import 'package:stepper/src/features/stepper/data/model/component/component_props/field/field_props/field_option/field_option_model.dart';

class FieldOptionEntity extends Equatable {
  const FieldOptionEntity({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  FieldOptionEntity.fromModel(
    FieldOptionModel fieldOptionModel,
  ) : this(
          label: fieldOptionModel.label,
          value: fieldOptionModel.value,
        );

  @override
  List<Object?> get props => [label, value];
}
