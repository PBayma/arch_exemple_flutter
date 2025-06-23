import 'package:arquitetura_app/details/data/repository/details_repository.dart';
import 'package:arquitetura_app/details/domain/details_repository_interface.dart';
import 'package:arquitetura_app/home/domain/repository/home_repository_interface.dart';
import 'package:arquitetura_app/home/data/repository/home_repository.dart';

import 'injections.dart';

class RepositoryInjection {
  static void setup() {
    getIt.registerSingleton<IHomeRepository>(HomeRepository());
    getIt.registerLazySingleton<IDetailsRepository>(
      () => DetailsRepository(),
    );
  }
}
