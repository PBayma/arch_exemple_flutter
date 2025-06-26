import 'package:flutter/material.dart';
import 'package:foundation/foundation.dart';

import 'view/home_view.dart';
import 'domain/usecases/get_home_usecase.dart';

class HomeModule extends StatelessWidget {
  final GetHomeUsecase usecase;

  const HomeModule(
    this.usecase, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HomeView(
      usecase: usecase,
      onTap: onTap,
      onTapWithArguments: onTapWithArguments,
    );
  }

  void onTapWithArguments(BuildContext context, String cityName) {
    Navigator.pushNamed(
      context,
      AppRouter.details,
      arguments: cityName,
    );
  }

  void onTap(BuildContext context) {
    Navigator.pushNamed(
      context,
      AppRouter.details,
    );
  }
}
