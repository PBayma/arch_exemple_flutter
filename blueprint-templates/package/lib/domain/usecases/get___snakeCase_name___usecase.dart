import 'package:foundation/foundation.dart';

import '../../data/models/{{snakeCase name}}_model.dart';
import '../../data/repository/{{snakeCase name}}_repository.dart';

class Get{{pascalCase name}}UseCase implements UseCase<{{pascalCase name}}ModelExample, NoParams> {
  final {{pascalCase name}}Repository repository;

  Get{{pascalCase name}}UseCase(this.repository);

  @override
  Future<{{pascalCase name}}ModelExample> call(NoParams params) {
    return repository.fetchData();
  }
}