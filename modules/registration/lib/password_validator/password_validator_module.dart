import 'package:flutter/material.dart';
import 'package:foundation/foundation.dart';

import '../domain/usecases/get_lenght_validator_usecase.dart';
import '../domain/usecases/get_number_validator_usecase.dart';
import '../domain/usecases/get_special_char_validator_usecase.dart';
import '../domain/usecases/get_uppercase_validator_usecase.dart';
import 'view/password_validator_view.dart';

class PasswordValidatorModuleParameters {
  PasswordValidatorModuleParameters();
}

class PasswordValidatorModule extends BaseModule<EmptyModuleParameters> {
  final GetLengthValidatorUseCase lenghtUsecase;
  final GetUppercaseValidatorUseCase uppercaseUsecase;
  final GetSpecialCharValidatorUseCase specialCharUsecase;
  final GetNumberValidatorUseCase numberUsecase;

  const PasswordValidatorModule(
    this.lenghtUsecase,
    this.uppercaseUsecase,
    this.specialCharUsecase,
    this.numberUsecase, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PasswordValidatorView(
      lenghtUsecase: lenghtUsecase,
      uppercaseUsecase: uppercaseUsecase,
      specialCharUsecase: specialCharUsecase,
      numberUsecase: numberUsecase,
    );
  }
}
