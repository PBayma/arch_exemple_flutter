import 'package:flutter/material.dart';

import 'view/home_view.dart';
import 'domain/repository/home_repository_interface.dart';

class HomeModule extends StatelessWidget {
  final IHomeRepository repository;

  const HomeModule(
    this.repository, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HomeView(
      repository: repository,
    );
  }
}
