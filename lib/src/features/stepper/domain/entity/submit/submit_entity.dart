import 'package:equatable/equatable.dart';
import 'package:stepper/src/features/stepper/domain/entity/submit/field/submit_field_entity.dart';

class SubmitEntity extends Equatable {
  const SubmitEntity({
    required this.fields,
  });

  final List<SubmitFieldEntity> fields;

  @override
  List<Object?> get props => [fields];
}
