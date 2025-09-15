import 'package:foundation/foundation.dart';

import '../../data/models/cep_details.dart';
import '../../data/repository/details_repository.dart';

class GetDetailsUsecase implements UseCase<CepDetails, String> {
  final IDetailsRepository detailsRepository;

  GetDetailsUsecase({
    required this.detailsRepository,
  });

  @override
  Future<CepDetails> call(String params) async {
    return await detailsRepository.fetchData(params);
  }
}
