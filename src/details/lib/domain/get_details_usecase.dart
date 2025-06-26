import 'package:foundation/foundation.dart';

import '../data/models/cep_details.dart';
import '../data/repository/details_repository.dart';

class GetDetailsUsecase implements UseCase<CepDetails, NoParams> {
  final IDetailsRepository detailsRepository;

  GetDetailsUsecase({
    required this.detailsRepository,
  });

  @override
  Future<CepDetails> call(NoParams _) async {
    return await detailsRepository.fetchData();
  }
}
