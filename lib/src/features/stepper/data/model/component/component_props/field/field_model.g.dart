// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FieldModel _$FieldModelFromJson(Map<String, dynamic> json) {
  return FieldModel(
    key: json['key'] as String?,
    type: _$enumDecodeNullable(_$FieldTypeEnumMap, json['type']),
    label: json['label'] as String?,
    props: json['props'] == null
        ? null
        : FieldPropsModel.fromJson(json['props'] as Map<String, dynamic>),
    validation: json['validation'] == null
        ? null
        : ValidationModel.fromJson(json['validation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FieldModelToJson(FieldModel instance) =>
    <String, dynamic>{
      'key': instance.key,
      'type': _$FieldTypeEnumMap[instance.type],
      'label': instance.label,
      'props': instance.props,
      'validation': instance.validation,
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

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$FieldTypeEnumMap = {
  FieldType.select: 'select',
  FieldType.text: 'text',
  FieldType.checkboxGroup: 'checkbox-group',
};
