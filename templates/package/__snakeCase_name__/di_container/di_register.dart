import '../../core/dependency_injection/injections.dart';
import '../../core/dependency_injection/modules_injection.dart';
import '../{{snakeCase name}}_module.dart';


class {{pascalCase name}}Container implements IContainers {
  @override
  void register() {
    getIt.registerFactory(
      () => {{pascalCase name}}Module(
        getIt.get(),
      ),
    );
  }
}
