import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/src/common/di/dependency_injector.dart';
import 'package:stepper/src/features/stepper/bloc/form_builder/form_builder_bloc.dart';
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
      create: (context) => FormBuilderBloc(
        formRepository: getIt.get<FormRepository>(),
      )..add(
          InitFormBuilderEvent(
            formBuilderComponentEntity: formBuilderComponentEntity,
          ),
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
            child: _FormFooter(
              pageController: pageController,
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
}

class _FormFooter extends StatefulWidget {
  const _FormFooter({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final PageController pageController;

  @override
  __FormFooterState createState() => __FormFooterState();
}

class __FormFooterState extends State<_FormFooter> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormBuilderBloc, FormBuilderState>(
      builder: (context, state) {
        return ForwardButton(
          onPressed: state.ready ? _onPressed : null,
        );
      },
    );
  }

  void _onPressed() {
    context.read<StepperBloc>().add(
          SavedStepperEvent(
            submitEntity: context.read<FormBuilderBloc>().state.submitEntity,
          ),
        );
    widget.pageController.nextPage(
      duration: kThemeAnimationDuration,
      curve: Curves.easeInOut,
    );
  }
}
