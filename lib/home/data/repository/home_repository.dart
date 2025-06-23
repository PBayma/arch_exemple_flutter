import 'package:arquitetura_app/home/data/models/cep.dart';
import 'package:dio/dio.dart';

import '../../domain/repository/home_repository_interface.dart';

class HomeRepository implements IHomeRepository {
  @override
  Future<Cep> fetchData() async {
    final dio = Dio();
    final response = await dio.get('https://viacep.com.br/ws/71917180/json/');

    return Cep.fromMap(response.data as Map<String, dynamic>);
  }
}
