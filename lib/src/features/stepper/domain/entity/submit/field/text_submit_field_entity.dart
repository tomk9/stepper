import 'package:stepper/src/features/stepper/domain/entity/submit/field/submit_field_entity.dart';

class TextSubmitFieldEntity extends SubmitFieldEntity {
  TextSubmitFieldEntity({
    required this.key,
    required this.label,
    required this.required,
    required this.textValue,
  }) : super(
          key: key,
          label: label,
          required: required,
          value: {textValue},
        );

  @override
  final String key;
  @override
  final String label;
  @override
  final bool required;
  final String? textValue;

  @override
  List<Object?> get props => [key, label, required, textValue];
}
