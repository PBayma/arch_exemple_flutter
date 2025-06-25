import 'package:arquitetura_app/core/module_parameters.dart';
import 'package:flutter/material.dart';

import 'view/details_view.dart';
import 'domain/details_repository_interface.dart';

class DetailsModuleParameters extends ModuleParameters<String?> {
  DetailsModuleParameters({
    required super.args,
  });
}

class DetailsModule extends StatelessWidget {
  final IDetailsRepository repository;
  final ModuleParameters? parameters;

  const DetailsModule(
    this.repository, {
    super.key,
    this.parameters,
  });

  @override
  Widget build(BuildContext context) {
    return DetailsView(
      repository: repository,
      cityName: parameters?.args ?? '',
    );
  }
}
