import 'package:flutter/material.dart';
import 'package:foundation/foundation.dart';

import '../domain/usecases/get_details_usecase.dart';
import 'details_state.dart';

class DetailsViewModel with ChangeNotifier {
  final GetDetailsUsecase usecase;

  DetailsViewModel({
    required this.usecase,
  });

  DetailsState state = DetailsStateLoading();

  void startWriting() {
    if (state is DetailsStateLoaded) {
      state = DetailsStateLoaded(
        details: (state as DetailsStateLoaded).details,
        hasValidCep: (state as DetailsStateLoaded).hasValidCep,
        isWriting: true,
      );
      notifyListeners();
    }
  }

  void startScreen() async {
    state = DetailsStateLoading();
    notifyListeners();
    try {
      final cep = await usecase('01001000');
      state = DetailsStateLoaded(details: cep);
      notifyListeners();
    } catch (e) {
      state = DetailsStateError(message: 'Erro ao carregar dados iniciais');
      notifyListeners();
      return;
    }
  }

  void fetchData(String cepText) async {
    state = DetailsStateLoading();
    notifyListeners();

    final cep = await usecase(cepText);

    state = DetailsStateLoaded(details: cep, hasValidCep: true);

    notifyListeners();
  }
}
