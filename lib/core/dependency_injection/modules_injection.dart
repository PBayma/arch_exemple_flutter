import 'package:details/di_container/di_register.dart';
import 'package:foundation/injection_container.dart';
import 'package:home/di_container/di_resgister.dart';

final List<IContainers> listOfModules = [
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
