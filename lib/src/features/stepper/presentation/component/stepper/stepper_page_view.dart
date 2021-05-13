import 'package:flutter/material.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/component_entity.dart';
import 'package:stepper/src/features/stepper/presentation/component/stepper/stepper_page_item.dart';

class StepperPageView extends StatelessWidget {
  StepperPageView({
    Key? key,
    required this.componentList,
  }) : super(key: key);

  final List<ComponentEntity> componentList;

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: componentList.length,
      itemBuilder: _buildItem,
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return StepperPageItem(
      component: componentList[index],
      pageController: _pageController,
    );
  }
}
