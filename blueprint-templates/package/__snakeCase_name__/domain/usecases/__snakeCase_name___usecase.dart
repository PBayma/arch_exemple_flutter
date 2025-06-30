import 'package:foundation/foundation.dart';

import '../data/models/{{snakeCase name}}_model_example.dart';
import '../data/repository/{{snakeCase name}}_repository.dart';

class {{camelCase name}}GetUseCase implements UseCase<{{camelCase name}}Model, NoParams> {
  final {{camelCase name}}Repository repository;

  {{camelCase name}}GetUseCase(this.repository);

  @override
  Future<{{camelCase name}}Model> call(NoParams params) {
    return repository.fetchData();
  }
}