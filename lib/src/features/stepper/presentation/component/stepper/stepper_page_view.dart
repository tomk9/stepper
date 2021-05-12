import 'package:flutter/material.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/component_entity.dart';
import 'package:stepper/src/features/stepper/presentation/component/stepper/stepper_page_item.dart';

class StepperPageView extends StatefulWidget {
  StepperPageView({
    Key? key,
    required this.componentList,
  }) : super(key: key);

  final List<ComponentEntity> componentList;

  @override
  _StepperPageViewState createState() => _StepperPageViewState();
}

class _StepperPageViewState extends State<StepperPageView> {
  final _pageController = PageController();
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: PageView.builder(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.componentList.length,
            itemBuilder: _buildItem,
          ),
        ),
        if (_pageIndex != widget.componentList.length - 1)
          Positioned(
            right: 16,
            bottom: 16,
            child: IconButton(
              icon: Icon(Icons.forward),
              onPressed: _onForwardPressed,
            ),
          ),
      ],
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return StepperPageItem(
      component: widget.componentList[index],
    );
  }

  void _onForwardPressed() {
    setState(() {
      ++_pageIndex;
    });
    _pageController.animateToPage(
      _pageIndex,
      duration: kThemeAnimationDuration,
      curve: Curves.easeInOut,
    );
  }
}
