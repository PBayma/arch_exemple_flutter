import 'package:flutter/material.dart';

import '../../domain/usecases/get_cep_search_usecase.dart';
import 'cep_search_state.dart';

class CepSearchViewModel with ChangeNotifier {
  final GetCepSearchUseCase usecase;
  CepSearchViewModel({
    required this.usecase,
  });

  CepSearchStateLoaded _state = CepSearchStateLoaded(data: null);
  CepSearchState get state => _state;

  void fetchData(String cep) async {
    try {
      final result = await usecase(cep);

      _state = _state.copyWith(
        data: result,
        isWriting: false,
        isValidCep: true,
      );
      notifyListeners();
    } catch (e) {
      _state = _state.copyWith(
        isValidCep: false,
        isWriting: false,
      );
      notifyListeners();
    }
  }

  void startWriting() {
    _state = _state.copyWith(isWriting: true);
    notifyListeners();
  }
}
