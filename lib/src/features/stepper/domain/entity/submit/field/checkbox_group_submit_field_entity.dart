import 'package:stepper/src/features/stepper/domain/entity/submit/field/submit_field_entity.dart';

class CheckboxGroupSubmitFieldEntity extends SubmitFieldEntity {
  const CheckboxGroupSubmitFieldEntity({
    required this.key,
    required this.label,
    required this.required,
    required this.value,
  }) : super(
          key: key,
          label: label,
          required: required,
          value: value,
        );

  @override
  final String key;
  @override
  final String label;
  @override
  final bool required;
  @override
  final Set<String>? value;

  @override
  List<Object?> get props => [key, label, required, value];
}
