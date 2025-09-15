import 'package:flutter/material.dart';
import 'package:foundation/foundation.dart';

import '../../domain/usecases/get_cep_search_usecase.dart';
import '../../domain/usecases/get_lenght_validator_usecase.dart';
import '../../domain/usecases/get_number_validator_usecase.dart';
import '../../domain/usecases/get_special_char_validator_usecase.dart';
import '../../domain/usecases/get_uppercase_validator_usecase.dart';
import 'view/create_account_view.dart';

class CreateAccountModuleParameters {
  CreateAccountModuleParameters();
}

class CreateAccountModule extends BaseModule<EmptyModuleParameters> {
  final GetLengthValidatorUseCase lenghtUsecase;
  final GetUppercaseValidatorUseCase uppercaseUsecase;
  final GetSpecialCharValidatorUseCase specialCharUsecase;
  final GetNumberValidatorUseCase numberUsecase;
  final GetCepSearchUseCase cepSearchUseCase;

  const CreateAccountModule(
    this.lenghtUsecase,
    this.uppercaseUsecase,
    this.specialCharUsecase,
    this.numberUsecase,
    this.cepSearchUseCase, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CreateAccountView(
      lenghtUsecase: lenghtUsecase,
      uppercaseUsecase: uppercaseUsecase,
      specialCharUsecase: specialCharUsecase,
      numberUsecase: numberUsecase,
      cepSearchUseCase: cepSearchUseCase,
    );
  }
}
