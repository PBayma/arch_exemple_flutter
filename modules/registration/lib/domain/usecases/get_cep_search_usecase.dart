import 'package:foundation/foundation.dart';

import '../../../data/models/cep_search_model.dart';
import '../../../data/repository/cep_search_repository.dart';

class GetCepSearchUseCase implements UseCase<CepSearchModel, String> {
  final ICepSearchRepository cepRepository;

  GetCepSearchUseCase({required this.cepRepository});

  @override
  Future<CepSearchModel> call(String params) {
    return cepRepository.fetchData(params);
  }
}
