import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:stepper/src/features/stepper/data/model/component/component_props/component_props_model.dart';
import 'package:stepper/src/features/stepper/data/model/component/component_type/component_type.dart';

part 'component_model.g.dart';

@JsonSerializable()
class ComponentModel {
  const ComponentModel({
    this.id,
    this.type,
    this.props,
  });

  final String? id;
  final ComponentType? type;
  final ComponentPropsModel? props;

  factory ComponentModel.fromJson(Map<String, dynamic> json) =>
      _$ComponentModelFromJson(json);

  Map<String, dynamic> toJson() => _$ComponentModelToJson(this);
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
