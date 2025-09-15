import 'package:flutter/material.dart';

import '../../domain/usecases/get_lenght_validator_usecase.dart';
import '../../domain/usecases/get_number_validator_usecase.dart';
import '../../domain/usecases/get_special_char_validator_usecase.dart';
import '../../domain/usecases/get_uppercase_validator_usecase.dart';
import 'password_validator_state.dart';

class PasswordValidatorViewModel with ChangeNotifier {
  final GetLengthValidatorUseCase lenghtUsecase;
  final GetUppercaseValidatorUseCase uppercaseUsecase;
  final GetSpecialCharValidatorUseCase specialCharUsecase;
  final GetNumberValidatorUseCase numberUsecase;

  PasswordValidatorViewModel({
    required this.lenghtUsecase,
    required this.uppercaseUsecase,
    required this.specialCharUsecase,
    required this.numberUsecase,
  });

  PasswordValidatorStateLoaded _state = PasswordValidatorStateLoaded();
  PasswordValidatorState get state => _state;

  void validateLenght(String password) async {
    final result = await lenghtUsecase(password);

    _state = _state.copyWith(
      hasMinLength: result,
    );

    notifyListeners();
  }

  void validateSpecialChar(String password) async {
    final result = await specialCharUsecase(password);

    _state = _state.copyWith(hasSpecialChar: result);

    notifyListeners();
  }

  void validateNumber(String password) async {
    final result = await numberUsecase(password);

    _state = _state.copyWith(hasNumber: result);

    notifyListeners();
  }

  void validateUppercase(String password) async {
    final result = await uppercaseUsecase(password);

    _state = _state.copyWith(hasUppercase: result);

    notifyListeners();
  }
}
