import 'package:flutter/material.dart';

import 'domain/repository/{{snakeCase name}}_repository_interface.dart';
import 'view/{{snakeCase name}}_view.dart';

class {{pascalCase name}}ModuleParameters extends ModuleParameters<Object> {
  {{pascalCase name}}ModuleParameters({
    required super.args,
  });
}

class {{pascalCase name}}Module extends StatelessWidget {
  final I{{pascalCase name}}Repository repository;

  const {{pascalCase name}}Module(
    this.repository, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return {{pascalCase name}}View(
      repository: repository,
    );
  }
}
