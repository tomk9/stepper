// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'component_props_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComponentPropsModel _$ComponentPropsModelFromJson(Map<String, dynamic> json) {
  return ComponentPropsModel(
    fields: (json['fields'] as List<dynamic>?)
        ?.map((e) => FieldModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    text: json['text'] as String?,
    visible: json['visible'] as bool?,
  );
}

Map<String, dynamic> _$ComponentPropsModelToJson(
        ComponentPropsModel instance) =>
    <String, dynamic>{
      'fields': instance.fields,
      'text': instance.text,
      'visible': instance.visible,
    };
