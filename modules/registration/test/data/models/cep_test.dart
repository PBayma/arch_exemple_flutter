import 'package:flutter_test/flutter_test.dart';
import 'package:registration/data/models/cep_search_model.dart';

import '../../fixtures/helper/read_cep_json.dart';

void main() {
  late Map<String, dynamic> cepMap;

  setUp(() async {
    cepMap = await readCep();
  });

  test('parse successfully CEP', () async {
    final cep = CepSearchModel.fromMap(cepMap);

    expect(cep.logradouro, 'Avenida das Nações');
  });
}
