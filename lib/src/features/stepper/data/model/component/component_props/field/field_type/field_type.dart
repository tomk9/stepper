import 'package:json_annotation/json_annotation.dart';

enum FieldType {
  select,
  text,
  @JsonValue('checkbox-group')
  checkboxGroup,
}
