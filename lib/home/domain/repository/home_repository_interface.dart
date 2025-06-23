import 'package:arquitetura_app/home/data/models/cep.dart';

abstract class IHomeRepository {
  Future<Cep> fetchData();
}
