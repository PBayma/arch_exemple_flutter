import 'package:flutter/material.dart';

import 'package:arquitetura_app/home/view/home_view.dart';
import 'package:arquitetura_app/home/view_model/home_view_model.dart';

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
      viewModel: HomeViewModel(homeRepository: repository),
    );
  }
}
