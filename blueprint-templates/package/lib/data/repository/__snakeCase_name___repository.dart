import 'package:foundation/foundation.dart';

import '../models/{{snakeCase name}}_model.dart';

abstract class I{{pascalCase name}}Repository {
  Future<{{pascalCase name}}ModelExample> fetchData();
}


class {{pascalCase name}}Repository implements I{{pascalCase name}}Repository {
  @override
  Future<{{pascalCase name}}ModelExample> fetchData() async {
    // final dio = Dio();
    // final response = await dio.get('https://viacep.com.br/ws/71917180/json/');

    // return ModelName.fromMap(response.data as Map<String, dynamic>);
    return {{pascalCase name}}ModelExample(variableExample: '');;
  }
}
