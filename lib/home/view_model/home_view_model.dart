import 'package:flutter/material.dart';
import '../domain/repository/home_repository_interface.dart';
import 'home_state.dart';

class HomeViewModel with ChangeNotifier {
  final IHomeRepository homeRepository;
  HomeViewModel({
    required this.homeRepository,
  });

  HomeState state = HomeStateLoading();

  void fetchData() async {
    state = HomeStateLoading();

    final cep = await homeRepository.fetchData();

    state = HomeStateLoaded(title: cep.localidade);

    notifyListeners();
  }
}
