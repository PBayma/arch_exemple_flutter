import 'package:foundation/foundation.dart';

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
