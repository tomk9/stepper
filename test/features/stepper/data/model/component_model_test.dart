import 'package:flutter_test/flutter_test.dart';
import 'package:stepper/src/features/stepper/data/model/component/component_model.dart';
import 'package:stepper/src/features/stepper/data/model/component/component_props/component_props_model.dart';
import 'package:stepper/src/features/stepper/data/model/component/component_type/component_type.dart';

void main() {
  group('ComponentModel', () {
    test('fromJson should create object', () {
      final json = {
        'id': 'id',
        'type': 'text_component',
        'props': {
          'text': 'text',
          'visible': true,
        },
      };
      final componentModel = ComponentModel(
        id: 'id',
        type: ComponentType.textComponent,
        componentProps: ComponentPropsModel(
          text: 'text',
          visible: true,
        ),
      );
      final result = ComponentModel.fromJson(json);
      expect(result, componentModel);
    });
  });
}
