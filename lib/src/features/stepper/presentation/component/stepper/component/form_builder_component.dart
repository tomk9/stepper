import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/src/common/di/dependency_injector.dart';
import 'package:stepper/src/features/stepper/bloc/form/form_bloc.dart';
import 'package:stepper/src/features/stepper/bloc/stepper/stepper_bloc.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/form_builder_component_entity.dart';
import 'package:stepper/src/features/stepper/domain/repository/form/form_repository.dart';
import 'package:stepper/src/features/stepper/presentation/component/stepper/component/form/form_builder_field.dart';
import 'package:stepper/src/features/stepper/presentation/component/stepper/forward_button.dart';

class FormBuilderComponent extends StatelessWidget {
  const FormBuilderComponent({
    Key? key,
    required this.formBuilderComponentEntity,
    required this.pageController,
  }) : super(key: key);

  final FormBuilderComponentEntity formBuilderComponentEntity;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormBloc(
        stepperBloc: context.read<StepperBloc>(),
        formRepository: getIt.get<FormRepository>(),
      ),
      child: Column(
        children: [
          Expanded(
            child: Form(
              child: ListView.separated(
                itemCount: formBuilderComponentEntity.fields.length,
                itemBuilder: _buildItem,
                separatorBuilder: _buildSeparator,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: ForwardButton(
              onPressed: _onPressed,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return FormBuilderField(
      index: index,
      fieldEntity: formBuilderComponentEntity.fields[index],
    );
  }

  Widget _buildSeparator(BuildContext context, int index) {
    return const SizedBox(
      height: 16,
    );
  }

  void _onPressed() {
    pageController.nextPage(
      duration: kThemeAnimationDuration,
      curve: Curves.easeInOut,
    );
  }
}
