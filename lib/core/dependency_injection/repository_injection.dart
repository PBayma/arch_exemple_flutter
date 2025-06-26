import 'package:details/data/repository/details_repository.dart';
import 'package:foundation/injection_container.dart';
import 'package:home/data/repository/home_repository.dart';

class RepositoryInjection {
  static void setup() {
    getIt.registerFactory<IHomeRepository>(() => HomeRepository());
    getIt.registerFactory<IDetailsRepository>(
      () => DetailsRepository(),
    );
  }
}
