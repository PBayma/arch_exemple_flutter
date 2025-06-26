import 'package:flutter/material.dart';
import 'package:foundation/module_parameters.dart';

import 'view/details_view.dart';
import 'domain/details_repository_interface.dart';

class DetailsModuleParameters extends ModuleParameters<String?> {
  DetailsModuleParameters({
    required super.args,
  });
}

class DetailsModule extends StatelessWidget {
  final IDetailsRepository repository;
  final ModuleParameters parameters;

  const DetailsModule(
    this.repository, {
    super.key,
    this.parameters = const EmptyModuleParameters(),
  });

  @override
  Widget build(BuildContext context) {
    return DetailsView(
      repository: repository,
      cityName: parameters.args ?? '',
    );
  }
}
