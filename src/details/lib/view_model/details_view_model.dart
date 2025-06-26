import 'package:details/domain/get_details_usecase.dart';
import 'package:foundation/foundation.dart';

import 'details_state.dart';
import 'package:flutter/material.dart';

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
