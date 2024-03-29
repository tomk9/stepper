// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'component_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComponentModel _$ComponentModelFromJson(Map<String, dynamic> json) {
  return ComponentModel(
    id: json['id'] as String,
    type: _$enumDecode(_$ComponentTypeEnumMap, json['type']),
    componentProps: json['props'] == null
        ? null
        : ComponentPropsModel.fromJson(json['props'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ComponentModelToJson(ComponentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$ComponentTypeEnumMap[instance.type],
      'props': instance.componentProps,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$ComponentTypeEnumMap = {
  ComponentType.staticComponentOne: 'static_component_one',
  ComponentType.textComponent: 'text_component',
  ComponentType.formBuilderComponent: 'form_builder_component',
  ComponentType.submitComponent: 'submit_component',
};
