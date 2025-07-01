import 'package:foundation/foundation.dart';

import 'usecase_injection.dart';
import 'modules_injection.dart';
import 'repository_injection.dart';

class Injections {
  static void setUp() {
    getIt.registerSingleton<Dio>(Dio());

    RepositoryInjection.setup();
    UsecaseInjection.setUp();
    ModulesInjection.setup();
  }
}
