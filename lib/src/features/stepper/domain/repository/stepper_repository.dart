import 'package:stepper/src/features/stepper/domain/entity/component/component_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/submit/submit_entity.dart';

abstract class StepperRepository {
  Future<List<ComponentEntity>> getComponentList();

  Future<SubmitEntity> submit();
}
