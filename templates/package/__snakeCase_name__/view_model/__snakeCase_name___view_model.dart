import 'package:flutter/material.dart';
import '../domain/repository/{{snakeCase name}}_repository_interface.dart';
import '{{snakeCase name}}_state.dart';

class {{pascalCase name}}ViewModel with ChangeNotifier {
  final I{{pascalCase name}}Repository {{camelCase name}}Repository;
  {{pascalCase name}}ViewModel({
    required this.{{camelCase name}}Repository,
  });

  {{pascalCase name}}State _state = {{pascalCase name}}StateLoading();
  {{pascalCase name}}State get state => _state;

  void fetchData() async {
    _state = {{pascalCase name}}StateLoading();
    notifyListeners();

    final args = await {{camelCase name}}Repository.fetchData();

    _state = {{pascalCase name}}StateLoaded(args: args);

    notifyListeners();
  }
}
