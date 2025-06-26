import 'package:details/data/repository/details_repository.dart';
import 'package:details/domain/details_repository_interface.dart';
import 'package:foundation/injection_container.dart';
import 'package:home/data/repository/home_repository.dart';
import 'package:home/domain/repository/home_repository_interface.dart';

class RepositoryInjection {
  static void setup() {
    getIt.registerFactory<IHomeRepository>(() => HomeRepository());
    getIt.registerFactory<IDetailsRepository>(
      () => DetailsRepository(),
    );
  }
}
