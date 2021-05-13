import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/src/common/di/dependency_injector.dart';
import 'package:stepper/src/features/application/presentation/component/stepper_material_app.dart';
import 'package:stepper/src/features/stepper/bloc/stepper/stepper_bloc.dart';
import 'package:stepper/src/features/stepper/domain/repository/stepper_repository.dart';

class StepperApp extends StatelessWidget {
  const StepperApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => StepperBloc(
            stepperRepository: getIt.get<StepperRepository>(),
          ),
        ),
      ],
      child: const StepperMaterialApp(),
    );
  }
}
