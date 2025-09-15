import 'package:flutter_test/flutter_test.dart';
import 'package:foundation/foundation.dart';

import 'package:registration/data/models/cep_search_model.dart';
import 'package:registration/data/repository/cep_search_repository.dart';
import 'package:test_foundation/test_foundation.dart';

import '../../fixtures/mock_repositories.dart';

void main() {
  late DioMock dio;
  late CepSearchRepository cepSearchRepository;
  final validResult = CepSearchModel(
    logradouro: 'Brasília',
    ddd: '11',
  );
  const url = 'https://viacep.com.br/ws/11111111/json/';

  setUp(() {
    dio = DioMock();
    cepSearchRepository = CepSearchRepository(dio);
  });

  test('get successfuly home data', () async {
    when(() => dio.get(url)).thenAnswer(
      (_) => Future.value(Response(
        data: validResult.toMap(),
        requestOptions: RequestOptions(path: ''),
      )),
    );

    final result = await cepSearchRepository.fetchData('11111111');

    expect(result, validResult);
  });

  test('get an error trying to get home data', () async {
    final error = Exception('Failed to load data');

    when(() => dio.get(url)).thenThrow(error);

    expect(() async => await cepSearchRepository.fetchData('11111111'),
        throwsA(isA<Exception>()));
    verify(() => dio.get(url)).called(1);
  });
}
