import 'package:arquitetura_app/details/data/models/cep_details.dart';
import 'package:arquitetura_app/details/domain/details_repository_interface.dart';

import 'package:dio/dio.dart';

class DetailsRepository implements IDetailsRepository {
  @override
  Future<CepDetails> fetchData() async {
    final dio = Dio();
    final response = await dio.get('https://viacep.com.br/ws/71917180/json/');

    return CepDetails.fromMap(response.data as Map<String, dynamic>);
  }
}
