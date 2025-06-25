import 'package:arquitetura_app/core/dependency_injection/injections.dart';
import 'package:arquitetura_app/details/details_module.dart';
import 'package:arquitetura_app/home/home_module.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String home = '/';
  static const String details = '/details';
}

final routes = {
  AppRouter.home: (context) => HomeModule(getIt.get()),
};

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRouter.home:
      return MaterialPageRoute(
        builder: (context) => HomeModule(
          getIt.get(),
        ),
      );
    case AppRouter.details:
      return MaterialPageRoute(
        builder: (context) => DetailsModule(
          getIt.get(),
          parameters: DetailsModuleParameters(
            args: settings.arguments as String?,
          ),
        ),
      );
    default:
      return null;
  }
}
