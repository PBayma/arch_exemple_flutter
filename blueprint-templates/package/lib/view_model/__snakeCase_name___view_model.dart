import 'package:flutter/material.dart';
import 'package:foundation/foundation.dart';

import '../domain/usecases/get_{{snakeCase name}}_usecase.dart';
import '{{snakeCase name}}_state.dart';

class {{pascalCase name}}ViewModel with ChangeNotifier {
  final Get{{pascalCase name}}UseCase usecase;
  {{pascalCase name}}ViewModel({
    required this.usecase,
  });

  {{pascalCase name}}State _state = {{pascalCase name}}StateLoading();
  {{pascalCase name}}State get state => _state;

  void fetchData() async {
    _state = {{pascalCase name}}StateLoading();
    notifyListeners();

    final args = await usecase(NoParams());

    _state = {{pascalCase name}}StateLoaded(args: args);

    notifyListeners();
  }
}
