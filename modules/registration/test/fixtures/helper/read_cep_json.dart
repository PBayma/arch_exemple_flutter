import 'dart:convert';
import 'dart:io';

const _cepJson = '/test/fixtures/jsons/cep.json';

Future<Map<String, dynamic>> readCep() async {
  final fullPath = '${Directory.current.path}$_cepJson';
  var input = await File(fullPath).readAsString();
  var map = jsonDecode(input);

  return map;
}
