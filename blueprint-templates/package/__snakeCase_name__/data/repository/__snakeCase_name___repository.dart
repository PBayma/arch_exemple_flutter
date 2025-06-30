import 'package:dio/dio.dart';

import '../../domain/repository/{{snakeCase name}}_repository_interface.dart';

class {{pascalCase name}}Repository implements I{{pascalCase name}}Repository {
  @override
  Future<Object?> fetchData() async {
    // final dio = Dio();
    // final response = await dio.get('https://viacep.com.br/ws/71917180/json/');

    // return ModelName.fromMap(response.data as Map<String, dynamic>);
    return null;
  }
}
