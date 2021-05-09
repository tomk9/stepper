import 'package:json_annotation/json_annotation.dart';

enum ComponentType {
  @JsonValue('static_component_one')
  staticComponentOne,
  @JsonValue('text_component')
  textComponent,
  @JsonValue('form_builder_component')
  formBuilderComponent,
  @JsonValue('submit_component')
  submitComponent,
}
