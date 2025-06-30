// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:foundation/foundation.dart';

import 'domain/usecases/get_details_usecase.dart';
import 'view/details_view.dart';

class DetailsModuleParameters {
  final String cityName;
  final String uf;
  final String rua;

  factory DetailsModuleParameters.empty() {
    return DetailsModuleParameters(
      cityName: '',
      uf: '',
      rua: '',
    );
  }

  DetailsModuleParameters({
    required this.cityName,
    required this.uf,
    required this.rua,
  });
}

class DetailsModule extends BaseModule<DetailsModuleParameters> {
  final GetDetailsUsecase useCase;

  const DetailsModule(
    this.useCase, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final parameters = getParams(context);

    return DetailsView(
      useCase: useCase,
      cityName: parameters.cityName,
    );
  }
}
