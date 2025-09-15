import 'package:details/di_container/di_register.dart';
import 'package:foundation/foundation.dart';
import 'package:home/di_container/di_resgister.dart';
import 'package:registration/di_container/di_register.dart';

final List<IContainers> listOfModules = [
  HomeContainer(),
  DetailsContainer(),
  RegistrationContainer(),
];

class ModulesInjection {
  static void setup() {
    for (var module in listOfModules) {
      module.register();
    }
  }
}
