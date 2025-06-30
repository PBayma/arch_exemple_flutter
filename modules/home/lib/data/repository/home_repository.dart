import 'package:foundation/foundation.dart';

import '../models/cep.dart';

abstract class IHomeRepository {
  Future<Cep> fetchData();
}

class HomeRepository implements IHomeRepository {
  final Dio dio;

  HomeRepository({required this.dio});

  @override
  Future<Cep> fetchData() async {
    final response = await dio.get('https://viacep.com.br/ws/71917180/json/');

    return Cep.fromMap(response.data as Map<String, dynamic>);
  }
}
