import 'package:flutter/material.dart';

import '../../domain/usecases/get_lenght_validator_usecase.dart';
import '../../domain/usecases/get_number_validator_usecase.dart';
import '../../domain/usecases/get_special_char_validator_usecase.dart';
import '../../domain/usecases/get_uppercase_validator_usecase.dart';
import '../view_model/password_validator_state.dart';
import '../view_model/password_validator_view_model.dart';

class PasswordValidatorView extends StatefulWidget {
  final GetLengthValidatorUseCase lenghtUsecase;
  final GetUppercaseValidatorUseCase uppercaseUsecase;
  final GetSpecialCharValidatorUseCase specialCharUsecase;
  final GetNumberValidatorUseCase numberUsecase;

  const PasswordValidatorView({
    super.key,
    required this.lenghtUsecase,
    required this.uppercaseUsecase,
    required this.specialCharUsecase,
    required this.numberUsecase,
  });

  @override
  State<PasswordValidatorView> createState() => _PasswordValidatorViewState();
}

class _PasswordValidatorViewState extends State<PasswordValidatorView> {
  late PasswordValidatorViewModel viewModel;

  @override
  void initState() {
    viewModel = PasswordValidatorViewModel(
      lenghtUsecase: widget.lenghtUsecase,
      uppercaseUsecase: widget.uppercaseUsecase,
      specialCharUsecase: widget.specialCharUsecase,
      numberUsecase: widget.numberUsecase,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) => switch (viewModel.state) {
        PasswordValidatorStateLoading _ => Center(
            child: Text('Loadings'),
          ),
        PasswordValidatorStateLoaded loaded => LoadedBody(
            state: loaded,
            viewModel: viewModel,
          ),
      },
    );
  }
}

class LoadedBody extends StatefulWidget {
  final PasswordValidatorViewModel viewModel;
  final PasswordValidatorStateLoaded state;
  const LoadedBody({
    super.key,
    required this.state,
    required this.viewModel,
  });

  @override
  State<LoadedBody> createState() => _LoadedBodyState();
}

class _LoadedBodyState extends State<LoadedBody> {
  final TextEditingController _controller = TextEditingController();

  void _onChangedPassword(String value) {
    widget.viewModel.validateLenght(value);
    widget.viewModel.validateNumber(value);
    widget.viewModel.validateSpecialChar(value);
    widget.viewModel.validateUppercase(value);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _controller,
            onChanged: _onChangedPassword,
            decoration: InputDecoration(
              labelText: "Digite sua senha",
            ),
          ),
          Text("Requisitos da senha:"),
          SizedBox(height: 8),
          Text(
            '- Pelo menos 8 caracteres',
            style: TextStyle(
              color: widget.state.hasMinLength ? Colors.green : Colors.red,
            ),
          ),
          Text(
            '- Pelo menos uma letra maiúscula',
            style: TextStyle(
              color: widget.state.hasUppercase ? Colors.green : Colors.red,
            ),
          ),
          Text(
            '- Pelo menos um número',
            style: TextStyle(
              color: widget.state.hasNumber ? Colors.green : Colors.red,
            ),
          ),
          Text(
            '- Pelo menos um caractere especial',
            style: TextStyle(
              color: widget.state.hasSpecialChar ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
