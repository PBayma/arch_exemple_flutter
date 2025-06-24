import '../../core/dependency_injection/modules_injection.dart';
import '../home_module.dart';
import '../../core/dependency_injection/injections.dart';

class HomeContainer implements IContainers {
  @override
  void register() {
    getIt.registerFactory(
      () => HomeModule(
        getIt.get(),
      ),
    );
  }
}
