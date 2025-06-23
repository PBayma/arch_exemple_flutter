import '../domain/details_repository_interface.dart';
import 'details_state.dart';
import 'package:flutter/material.dart';

class DetailsViewModel with ChangeNotifier {
  final IDetailsRepository detailsRepository;
  DetailsViewModel({
    required this.detailsRepository,
  });

  DetailsState state = DetailsStateLoading();

  void fetchData() async {
    state = DetailsStateLoading();

    final cep = await detailsRepository.fetchData();

    state = DetailsStateLoaded(details: cep);

    notifyListeners();
  }
}
