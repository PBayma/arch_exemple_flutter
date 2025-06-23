import 'package:arquitetura_app/core/dependency_injection/injections.dart';
import 'package:arquitetura_app/details/details_module.dart';
import 'package:arquitetura_app/home/home_module.dart';

class AppRouter {
  static String home = '/';
  static String details = '/details';
}

final routes = {
  AppRouter.home: (context) => HomeModule(getIt.get()),
  AppRouter.details: (context) => DetailsModule(getIt.get()),
};
