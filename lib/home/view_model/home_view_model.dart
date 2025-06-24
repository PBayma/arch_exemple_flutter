import 'package:flutter/material.dart';
import '../domain/repository/home_repository_interface.dart';
import 'home_state.dart';

class HomeViewModel with ChangeNotifier {
  final IHomeRepository homeRepository;
  HomeViewModel({
    required this.homeRepository,
  });

  HomeState _state = HomeStateLoading();
  HomeState get state => _state;

  void fetchData() async {
    _state = HomeStateLoading();
    notifyListeners();

    final cep = await homeRepository.fetchData();

    _state = HomeStateLoaded(title: cep.localidade);

    notifyListeners();
  }
}
