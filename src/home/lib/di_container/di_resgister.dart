import 'package:foundation/injection_container.dart';

import '../home_module.dart';

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
