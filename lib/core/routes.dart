import 'package:details/details_module.dart';
import 'package:foundation/foundation.dart';
import 'package:home/home_module.dart';
import 'package:flutter/material.dart';
import 'package:registration/create_account/create_account_module.dart';

final routes = {
  AppRouter.home: (context) => HomeModule(getIt.get()),
};

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRouter.home:
      return MaterialPageRoute(
        builder: (context) => HomeModule(getIt.get()),
      );
    case AppRouter.details:
      return MaterialPageRoute(
        builder: (context) => DetailsModule(getIt.get()),
        settings: RouteSettings(
          arguments: settings.arguments,
        ),
      );
    case AppRouter.registration:
      return MaterialPageRoute(
        builder: (context) => CreateAccountModule(
          getIt.get(),
          getIt.get(),
          getIt.get(),
          getIt.get(),
          getIt.get(),
        ),
        settings: RouteSettings(
          arguments: settings.arguments,
        ),
      );
    default:
      return null;
  }
}
