import 'package:arquitetura_app/details/di_container/di_register.dart';

import '../../home/di_container/di_resgister.dart';

abstract class IContainers {
  void register();
}

final listOfModules = [
  HomeContainer(),
  DetailsContainer(),
];

class ModulesInjection {
  static void setup() {
    for (var module in listOfModules) {
      module.register();
    }
  }
}
