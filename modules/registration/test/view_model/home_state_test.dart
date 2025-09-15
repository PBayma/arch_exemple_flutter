import 'package:flutter_test/flutter_test.dart';
import 'package:registration/cep_search/view_model/cep_search_state.dart';
import 'package:registration/data/models/cep_search_model.dart';

void main() {
  test('empty state', () {
    final state = CepSearchStateLoaded(data: null);

    expect(state.data, isNull);
    expect(state.isValidCep, isFalse);
    expect(state.isWriting, isFalse);
  });

  test('Loaded state', () {
    final data = CepSearchModel(
      ddd: '11',
      logradouro: 'São Paulo',
    );

    final state = CepSearchStateLoaded(
      data: data,
      isValidCep: true,
      isWriting: false,
    );

    expect(state.data, isNull);
    expect(state.isValidCep, isTrue);
    expect(state.isWriting, isFalse);
  });
}
