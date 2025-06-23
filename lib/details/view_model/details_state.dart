import '../data/models/cep_details.dart';

sealed class DetailsState {}

class DetailsStateLoading extends DetailsState {}

class DetailsStateLoaded extends DetailsState {
  final CepDetails details;

  DetailsStateLoaded({required this.details});
}
