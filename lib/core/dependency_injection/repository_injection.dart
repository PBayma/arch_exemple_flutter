import 'package:details/data/repository/details_repository.dart';
import 'package:foundation/foundation.dart';
import 'package:home/data/repository/home_repository.dart';
import 'package:registration/data/repository/cep_search_repository.dart';

class RepositoryInjection {
  static void setup() {
    getIt.registerFactory<IHomeRepository>(
        () => HomeRepository(dio: getIt<Dio>()));
    getIt.registerFactory<IDetailsRepository>(
      () => DetailsRepository(),
    );
    getIt.registerFactory<ICepSearchRepository>(
      () => CepSearchRepository(getIt<Dio>()),
    );
  }
}
