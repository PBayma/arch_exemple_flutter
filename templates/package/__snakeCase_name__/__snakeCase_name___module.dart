import 'package:flutter/material.dart';

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
