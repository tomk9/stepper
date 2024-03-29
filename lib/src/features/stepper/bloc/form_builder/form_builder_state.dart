part of 'form_builder_bloc.dart';

class FormBuilderState extends Equatable {
  FormBuilderState({
    required this.submitEntity,
  }) : ready = _isReady(submitEntity);

  final SubmitEntity submitEntity;
  final bool ready;

  @override
  List<Object?> get props => [submitEntity, ready];

  static bool _isReady(SubmitEntity submitEntity) {
    final isReady = submitEntity.fields.isNotEmpty &&
        !submitEntity.fields.any(
          (element) =>
              element.required && (element.value?.first?.isEmpty ?? true),
        );
    return isReady;
  }
}
