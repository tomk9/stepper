import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'validation_model.g.dart';

@JsonSerializable()
class ValidationModel extends Equatable {
  const ValidationModel({
    required this.required,
  });

  final bool required;

  factory ValidationModel.fromJson(Map<String, dynamic> json) =>
      _$ValidationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ValidationModelToJson(this);

  @override
  List<Object?> get props => [required];
}
