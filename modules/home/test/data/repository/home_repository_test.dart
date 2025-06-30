import 'package:flutter_test/flutter_test.dart';
import 'package:foundation/foundation.dart';
import 'package:home/data/models/cep.dart';
import 'package:home/data/repository/home_repository.dart';
import 'package:test_foundation/test_foundation.dart';

import '../../fixtures/mock_repositories.dart';

void main() {
  late DioMock dio;
  late HomeRepository homeRepository;
  final validResult = Cep(
    localidade: 'Brasília',
  );
  const url = 'https://viacep.com.br/ws/71917180/json/';

  setUp(() {
    dio = DioMock();
    homeRepository = HomeRepository(dio: dio);
  });

  test('get successfuly home data', () async {
    when(() => dio.get(url)).thenAnswer(
      (_) => Future.value(Response(
        data: validResult.toMap(),
        requestOptions: RequestOptions(path: ''),
      )),
    );

    final result = await homeRepository.fetchData();

    expect(result, validResult);
  });

  test('get an error trying to get home data', () async {
    final error = Exception('Failed to load data');

    when(() => dio.get(url)).thenThrow(error);

    expect(() async => await homeRepository.fetchData(),
        throwsA(isA<Exception>()));
    verify(() => dio.get(url)).called(1);
  });
}
