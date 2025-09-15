import '../data/models/cep_details.dart';

sealed class DetailsState {}

class DetailsStateLoading extends DetailsState {}

class DetailsStateLoaded extends DetailsState {
  final CepDetails details;
  final bool isWriting;
  final bool? hasValidCep;

  DetailsStateLoaded({
    required this.details,
    this.hasValidCep,
    this.isWriting = false,
  });
}

class DetailsStateError extends DetailsState {
  final String message;

  DetailsStateError({required this.message});
}
