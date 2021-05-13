part of 'form_bloc.dart';

abstract class FormEvent extends Equatable {
  const FormEvent();
}

class InitFormEvent extends FormEvent {
  const InitFormEvent({
    required this.formBuilderComponentEntity,
  });

  final FormBuilderComponentEntity formBuilderComponentEntity;

  @override
  List<Object> get props => [formBuilderComponentEntity];
}

class ChangedFormEvent extends FormEvent {
  const ChangedFormEvent({
    required this.index,
    required this.submitFieldEntity,
  });

  final int index;
  final SubmitFieldEntity submitFieldEntity;

  @override
  List<Object> get props => [index, submitFieldEntity];
}
