import 'modules_injection.dart';
import 'repository_injection.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class Injections {
  static void setUp() {
    RepositoryInjection.setup();
    ModulesInjection.setup();
  }
}
