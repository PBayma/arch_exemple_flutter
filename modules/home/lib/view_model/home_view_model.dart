import 'package:flutter/material.dart';
import 'package:foundation/foundation.dart';

import '../domain/usecases/get_home_usecase.dart';
import 'home_state.dart';

class HomeViewModel with ChangeNotifier {
  final GetHomeUsecase usecase;
  HomeViewModel({
    required this.usecase,
  });

  HomeState _state = HomeStateLoading();
  HomeState get state => _state;

  void fetchData() async {
    _state = HomeStateLoading();
    notifyListeners();

    final cep = await usecase(NoParams());

    _state = HomeStateLoaded(title: cep.localidade);

    notifyListeners();
  }
}
