import 'package:foundation/foundation.dart';
import 'package:home/data/models/cep.dart';

import '../../data/repository/home_repository.dart';

class GetHomeUsecase implements UseCase<Cep, NoParams> {
  final IHomeRepository homeRepository;

  GetHomeUsecase({required this.homeRepository});

  @override
  Future<Cep> call(NoParams params) async {
    return await homeRepository.fetchData();
  }
}
