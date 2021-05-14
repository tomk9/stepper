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
    test('parseComponentList should create list of object', () {
      final text = '''
      [
        {
          "id": "hello-component",
          "type": "static_component_one"
        },
        {
          "id": "introduction-component",
          "type": "text_component",
          "props": {
            "text": "text which should i see in app"
          }
        }
      ]
      ''';
      final componentModelList = [
        ComponentModel(
          id: 'hello-component',
          type: ComponentType.staticComponentOne,
        ),
        ComponentModel(
          id: 'introduction-component',
          type: ComponentType.textComponent,
          componentProps: ComponentPropsModel(
            text: 'text which should i see in app',
          ),
        ),
      ];
      final result = parseComponentList(text);
      expect(result, componentModelList);
    });
  });
}
