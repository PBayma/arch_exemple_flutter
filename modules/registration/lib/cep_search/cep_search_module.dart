import 'package:flutter/material.dart';
import 'package:foundation/foundation.dart';

import '../domain/usecases/get_cep_search_usecase.dart';
import 'view/cep_search_view.dart';

class CepSearchModuleParameters {
  CepSearchModuleParameters();
}

class CepSearchModule extends BaseModule<EmptyModuleParameters> {
  final GetCepSearchUseCase usecase;

  const CepSearchModule(
    this.usecase, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CepSearchView(
      usecase: usecase,
    );
  }
}
