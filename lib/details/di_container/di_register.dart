import 'package:arquitetura_app/core/dependency_injection/injections.dart';
import 'package:arquitetura_app/core/dependency_injection/modules_injection.dart';
import 'package:arquitetura_app/details/details_module.dart';

class DetailsContainer implements IContainers {
  @override
  void register() {
    getIt.registerLazySingleton(
      () => DetailsModule(
        getIt.get(),
      ),
    );
  }
}
