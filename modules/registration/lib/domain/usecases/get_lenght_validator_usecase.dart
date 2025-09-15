import 'package:foundation/foundation.dart';

class GetLengthValidatorUseCase implements UseCase<bool, String> {
  @override
  Future<bool> call(String params) {
    return Future.value(params.length >= 8);
  }
}
