import 'package:foundation/foundation.dart';

import '../create_account/create_account_module.dart';

class RegistrationContainer implements IContainers {
  @override
  void register() {
    getIt.registerFactory(
      () => CreateAccountModule(
        getIt.get(),
        getIt.get(),
        getIt.get(),
        getIt.get(),
        getIt.get(),
      ),
    );
  }
}
