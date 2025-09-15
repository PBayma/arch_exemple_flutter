import 'package:foundation/foundation.dart';

class GetUppercaseValidatorUseCase implements UseCase<bool, String> {
  @override
  Future<bool> call(String params) {
    final uppercaseRegex = RegExp(r'[A-Z]');
    return Future.value(uppercaseRegex.hasMatch(params));
  }
}
