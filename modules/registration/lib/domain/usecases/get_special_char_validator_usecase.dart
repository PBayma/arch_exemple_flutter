import 'package:foundation/foundation.dart';

class GetSpecialCharValidatorUseCase implements UseCase<bool, String> {
  @override
  Future<bool> call(String params) {
    final specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    return Future.value(specialCharRegex.hasMatch(params));
  }
}
