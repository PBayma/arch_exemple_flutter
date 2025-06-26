import 'package:foundation/foundation.dart';

import '../models/cep_details.dart';
import '../../domain/details_repository_interface.dart';

class DetailsRepository implements IDetailsRepository {
  @override
  Future<CepDetails> fetchData() async {
    final dio = Dio();
    final response = await dio.get('https://viacep.com.br/ws/71917180/json/');

    return CepDetails.fromMap(response.data as Map<String, dynamic>);
  }
}
