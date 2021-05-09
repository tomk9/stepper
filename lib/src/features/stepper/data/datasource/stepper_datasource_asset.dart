import 'package:flutter/foundation.dart';
import 'package:stepper/src/common/asset/asset_loader.dart';
import 'package:stepper/src/features/stepper/data/datasource/stepper_datasource.dart';
import 'package:stepper/src/features/stepper/data/model/component/component_model.dart';

class StepperDatasourceAsset implements StepperDatasource {
  const StepperDatasourceAsset({
    required this.assetName,
  });

  final String assetName;

  @override
  Future<List<ComponentModel>> getComponentList() async {
    final resultString = await loadAsset(assetName);
    return compute(parseComponentList, resultString);
  }
}
