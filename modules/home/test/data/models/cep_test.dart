import 'package:flutter_test/flutter_test.dart';
import 'package:home/data/models/cep.dart';

import '../../fixtures/helper/read_cep_json.dart';

void main() {
  late Map<String, dynamic> cepMap;

  setUp(() async {
    cepMap = await readCep();
  });

  test('parse successfully CEP', () async {
    final cep = Cep.fromMap(cepMap);

    expect(cep.localidade, 'Brasilia');
  });
}
