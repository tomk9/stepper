import 'package:stepper/src/features/stepper/domain/entity/submit/submit_entity.dart';

abstract class StepperStorage {
  void saveFormResult(SubmitEntity submitEntity);

  SubmitEntity getFormResult();
}
