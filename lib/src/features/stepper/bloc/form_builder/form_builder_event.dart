part of 'form_builder_bloc.dart';

abstract class FormBuilderEvent extends Equatable {
  const FormBuilderEvent();
}

class InitFormBuilderEvent extends FormBuilderEvent {
  const InitFormBuilderEvent({
    required this.formBuilderComponentEntity,
  });

  final FormBuilderComponentEntity formBuilderComponentEntity;

  @override
  List<Object> get props => [formBuilderComponentEntity];
}

class ChangedFormBuilderEvent extends FormBuilderEvent {
  const ChangedFormBuilderEvent({
    required this.index,
    required this.submitFieldEntity,
  });

  final int index;
  final SubmitFieldEntity submitFieldEntity;

  @override
  List<Object> get props => [index, submitFieldEntity];
}
