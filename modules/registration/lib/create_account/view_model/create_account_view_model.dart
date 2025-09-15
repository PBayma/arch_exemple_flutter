import 'package:flutter/material.dart';
import 'create_account_state.dart';

class CreateAccountViewModel with ChangeNotifier {
  CreateAccountViewModel();

  CreateAccountState _state = CreateAccountStateLoaded();
  CreateAccountState get state => _state;
}
