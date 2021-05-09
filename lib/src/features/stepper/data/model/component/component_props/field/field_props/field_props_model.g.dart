// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_props_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FieldPropsModel _$FieldPropsModelFromJson(Map<String, dynamic> json) {
  return FieldPropsModel(
    options: (json['options'] as List<dynamic>?)
        ?.map((e) => FieldOptionModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$FieldPropsModelToJson(FieldPropsModel instance) =>
    <String, dynamic>{
      'options': instance.options,
    };
