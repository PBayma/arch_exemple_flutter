import 'package:flutter/material.dart';

import '../domain/usecases/get_{{snakeCase name}}_usecase.dart';
import '../view_model/{{snakeCase name}}_state.dart';
import '../view_model/{{snakeCase name}}_view_model.dart';

class {{pascalCase name}}View extends StatefulWidget {
  final Get{{pascalCase name}}UseCase usecase;

  const {{pascalCase name}}View({
    super.key,
    required this.usecase,
  });

  @override
  State<{{pascalCase name}}View> createState() => _{{pascalCase name}}ViewState();
}

class _{{pascalCase name}}ViewState extends State<{{pascalCase name}}View> {
  late {{pascalCase name}}ViewModel viewModel;

  @override
  void initState() {
    viewModel = {{pascalCase name}}ViewModel({{snakeCase name}}Usecase: widget.usecase);
    viewModel.fetchData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) => switch (viewModel.state) {
        {{pascalCase name}}StateLoading _ => Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text('Loadings'),
            ),
          ),
        {{pascalCase name}}StateLoaded loaded => Scaffold(
            appBar: AppBar(),
            body: LoadedBody(state: loaded),
          )
      },
    );
  }
}

class LoadedBody extends StatelessWidget {
  final {{pascalCase name}}StateLoaded state;
  const LoadedBody({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}