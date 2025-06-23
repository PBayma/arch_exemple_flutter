import '../data/models/cep_details.dart';

abstract class IDetailsRepository {
  Future<CepDetails> fetchData();
}
