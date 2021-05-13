import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:stepper/src/features/stepper/data/model/component/component_props/component_props_model.dart';
import 'package:stepper/src/features/stepper/data/model/component/component_type/component_type.dart';

part 'component_model.g.dart';

@JsonSerializable()
class ComponentModel extends Equatable {
  const ComponentModel({
    required this.id,
    required this.type,
    this.componentProps,
  });

  final String id;
  final ComponentType type;
  @JsonKey(name: 'props')
  final ComponentPropsModel? componentProps;

  factory ComponentModel.fromJson(Map<String, dynamic> json) =>
      _$ComponentModelFromJson(json);

  Map<String, dynamic> toJson() => _$ComponentModelToJson(this);

  @override
  List<Object?> get props => [id, type, componentProps];
}

List<ComponentModel> parseComponentList(String result) {
  final list = jsonDecode(result) as List;
  final componentList = list
      .map(
        (e) => ComponentModel.fromJson(e),
      )
      .toList();
  return componentList;
}
