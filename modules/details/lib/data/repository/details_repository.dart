import 'package:foundation/foundation.dart';

import '../models/cep_details.dart';

abstract class IDetailsRepository {
  Future<CepDetails> fetchData(String cep);
}

class DetailsRepository implements IDetailsRepository {
  @override
  Future<CepDetails> fetchData(String cep) async {
    final dio = Dio();
    final response = await dio.get('https://viacep.com.br/ws/$cep/json/');

    if (response.statusCode != 200) {
      throw Exception('Failed to load CEP details');
    } else if (response.data['erro'] == true) {
      throw Exception('CEP not found');
    }

    return CepDetails.fromMap(response.data as Map<String, dynamic>);
  }
}
