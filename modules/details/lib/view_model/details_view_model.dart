import 'package:flutter/material.dart';
import 'package:foundation/foundation.dart';

import '../domain/get_details_usecase.dart';
import 'details_state.dart';

class DetailsViewModel with ChangeNotifier {
  final GetDetailsUsecase usecase;

  DetailsViewModel({
    required this.usecase,
  });

  DetailsState state = DetailsStateLoading();

  void fetchData() async {
    state = DetailsStateLoading();

    final cep = await usecase(NoParams());

    state = DetailsStateLoaded(details: cep);

    notifyListeners();
  }
}
