import 'package:foundation/foundation.dart';

import '../models/cep_search_model.dart';

abstract class ICepSearchRepository {
  Future<CepSearchModel> fetchData(String cep);
}

class CepSearchRepository implements ICepSearchRepository {
  final Dio dio;

  CepSearchRepository(this.dio);

  @override
  Future<CepSearchModel> fetchData(String cep) async {
    final response = await dio.get('https://viacep.com.br/ws/$cep/json/');

    return CepSearchModel.fromMap(response.data as Map<String, dynamic>);
  }
}
