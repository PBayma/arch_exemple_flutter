import 'package:flutter/material.dart';
import 'package:foundation/foundation.dart';

import 'domain/usecases/get_{{snakeCase name}}_usecase.dart';
import 'view/{{snakeCase name}}_view.dart';

class {{pascalCase name}}ModuleParameters {
  {{pascalCase name}}ModuleParameters();
}

class {{pascalCase name}}Module extends  BaseModule<EmptyModuleParameters> {
  final Get{{pascalCase name}}UseCase usecase;

  const {{pascalCase name}}Module(
    this.usecase, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return {{pascalCase name}}View(
      usecase: usecase,
    );
  }
}
