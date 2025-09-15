import 'package:flutter/material.dart';

import '../../../cep_search/cep_search_module.dart';
import '../../../domain/usecases/get_cep_search_usecase.dart';
import '../../../domain/usecases/get_lenght_validator_usecase.dart';
import '../../../domain/usecases/get_number_validator_usecase.dart';
import '../../../domain/usecases/get_special_char_validator_usecase.dart';
import '../../../domain/usecases/get_uppercase_validator_usecase.dart';
import '../../../password_validator/password_validator_module.dart';
import '../view_model/create_account_state.dart';
import '../view_model/create_account_view_model.dart';

class CreateAccountView extends StatefulWidget {
  final GetLengthValidatorUseCase lenghtUsecase;
  final GetUppercaseValidatorUseCase uppercaseUsecase;
  final GetSpecialCharValidatorUseCase specialCharUsecase;
  final GetNumberValidatorUseCase numberUsecase;
  final GetCepSearchUseCase cepSearchUseCase;

  const CreateAccountView({
    super.key,
    required this.lenghtUsecase,
    required this.uppercaseUsecase,
    required this.specialCharUsecase,
    required this.numberUsecase,
    required this.cepSearchUseCase,
  });

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  late CreateAccountViewModel viewModel;

  @override
  void initState() {
    viewModel = CreateAccountViewModel();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) => switch (viewModel.state) {
        CreateAccountStateLoaded _ => Scaffold(
            appBar: AppBar(
              title: Text('Cadastro de conta'),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(child: CepSearchModule(widget.cepSearchUseCase)),
                Flexible(
                  child: PasswordValidatorModule(
                    widget.lenghtUsecase,
                    widget.uppercaseUsecase,
                    widget.specialCharUsecase,
                    widget.numberUsecase,
                  ),
                )
              ],
            ),
          )
      },
    );
  }
}
