import 'package:flutter/material.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/component_entity.dart';
import 'package:stepper/src/features/stepper/presentation/component/stepper/stepper_page_item.dart';

class StepperPageView extends StatefulWidget {
  const StepperPageView({
    Key? key,
    required this.componentList,
  }) : super(key: key);

  final List<ComponentEntity> componentList;

  @override
  _StepperPageViewState createState() => _StepperPageViewState();
}

class _StepperPageViewState extends State<StepperPageView> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.componentList.length,
      itemBuilder: _buildItem,
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return StepperPageItem(
      component: widget.componentList[index],
      pageController: _pageController,
    );
  }
}
