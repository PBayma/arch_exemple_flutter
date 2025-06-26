import 'package:foundation/foundation.dart';

import 'domain/get_details_usecase.dart';
import 'package:flutter/material.dart';

import 'view/details_view.dart';

class DetailsModuleParameters extends ModuleParameters<String?> {
  DetailsModuleParameters({
    required super.args,
  });
}

class DetailsModule extends StatelessWidget {
  final GetDetailsUsecase useCase;
  final ModuleParameters parameters;

  const DetailsModule(
    this.useCase, {
    super.key,
    this.parameters = const EmptyModuleParameters(),
  });

  @override
  Widget build(BuildContext context) {
    return DetailsView(
      useCase: useCase,
      cityName: parameters.args ?? '',
    );
  }
}
