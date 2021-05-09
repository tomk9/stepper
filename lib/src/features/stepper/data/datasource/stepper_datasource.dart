import 'package:stepper/src/features/stepper/data/model/component/component_model.dart';

abstract class StepperDatasource {
  Future<List<ComponentModel>> getComponentList();
}
