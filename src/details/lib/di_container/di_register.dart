import 'package:foundation/injection_container.dart';

import '../details_module.dart';

class DetailsContainer implements IContainers {
  @override
  void register() {
    getIt.registerFactory(
      () => DetailsModule(
        getIt.get(),
      ),
    );
  }
}
