import 'package:foundation/foundation.dart';

class GetNumberValidatorUseCase implements UseCase<bool, String> {
  @override
  Future<bool> call(String params) {
    final numberRegex = RegExp(r'[0-9]');
    return Future.value(numberRegex.hasMatch(params));
  }
}
