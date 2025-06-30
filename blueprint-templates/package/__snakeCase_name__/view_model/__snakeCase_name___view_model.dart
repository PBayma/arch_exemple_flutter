import 'package:flutter/material.dart';
import 'package:foundation/foundation.dart';

import '../domain/usecases/get_{{snakeCase name}}_usecase.dart';
import '{{snakeCase name}}_state.dart';

class {{pascalCase name}}ViewModel with ChangeNotifier {
  final Get{{pascalCase name}}UseCase {{camelCase name}}Usecase;
  {{pascalCase name}}ViewModel({
    required this.{{camelCase name}}Usecase,
  });

  {{pascalCase name}}State _state = {{pascalCase name}}StateLoading();
  {{pascalCase name}}State get state => _state;

  void fetchData() async {
    _state = {{pascalCase name}}StateLoading();
    notifyListeners();

    final args = await {{camelCase name}}Usecase(NoParams());

    _state = {{pascalCase name}}StateLoaded(args: args);

    notifyListeners();
  }
}
