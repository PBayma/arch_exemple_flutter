import 'package:details/details_module.dart';
import 'package:foundation/app_router.dart';
import 'package:foundation/injection_container.dart';
import 'package:home/home_module.dart';

import 'package:flutter/material.dart';

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
