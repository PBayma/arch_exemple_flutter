import '../../data/models/cep_search_model.dart';

sealed class CepSearchState {}

class CepSearchStateLoaded extends CepSearchState {
  final bool? isValidCep;
  final bool isWriting;
  final CepSearchModel? data;

  CepSearchStateLoaded copyWith({
    bool? isValidCep,
    bool? isWriting,
    CepSearchModel? data,
  }) {
    return CepSearchStateLoaded(
      data: data ?? this.data,
      isValidCep: isValidCep ?? this.isValidCep,
      isWriting: isWriting ?? this.isWriting,
    );
  }

  CepSearchStateLoaded({
    required this.data,
    this.isValidCep,
    this.isWriting = false,
  });
}
