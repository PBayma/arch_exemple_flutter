import '../../data/models/cep.dart';

abstract class IHomeRepository {
  Future<Cep> fetchData();
}
