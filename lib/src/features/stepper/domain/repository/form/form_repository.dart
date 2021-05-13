import 'package:stepper/src/features/stepper/domain/entity/component/field/field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/submit/field/submit_field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/submit/submit_entity.dart';

abstract class FormRepository {
  SubmitEntity onChanged(
    int index,
    SubmitFieldEntity submitFieldEntity,
  );

  SubmitEntity initForm(List<FieldEntity> fields);
}
