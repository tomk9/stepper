import 'package:flutter/material.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/form_builder_component_entity.dart';

// TODO: Implement form builder
class FormBuilderComponent extends StatelessWidget {
  const FormBuilderComponent({
    Key? key,
    required this.formBuilderComponentEntity,
  }) : super(key: key);
  final FormBuilderComponentEntity formBuilderComponentEntity;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: formBuilderComponentEntity.fields.length,
      itemBuilder: _buildItem,
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return Container();
  }
}
