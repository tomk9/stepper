import 'package:flutter/material.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/static_component_entity.dart';

class StaticComponent extends StatelessWidget {
  const StaticComponent({
    Key? key,
    required this.staticComponentEntity,
  }) : super(key: key);

  final StaticComponentEntity staticComponentEntity;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: FlutterLogo(),
    );
  }
}
