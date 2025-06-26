import 'package:foundation/foundation.dart';

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
