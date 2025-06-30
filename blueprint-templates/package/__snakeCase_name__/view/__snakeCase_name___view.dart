import 'package:flutter/material.dart';

import '../domain/repository/{{snakeCase name}}_repository_interface.dart';
import '../view_model/{{snakeCase name}}_state.dart';
import '../view_model/{{snakeCase name}}_view_model.dart';

class {{pascalCase name}}View extends StatefulWidget {
  final I{{pascalCase name}}Repository repository;

  const {{pascalCase name}}View({
    super.key,
    required this.repository,
  });

  @override
  State<{{pascalCase name}}View> createState() => _{{pascalCase name}}ViewState();
}

class _{{pascalCase name}}ViewState extends State<{{pascalCase name}}View> {
  late {{pascalCase name}}ViewModel viewModel;

  @override
  void initState() {
    viewModel = {{pascalCase name}}ViewModel({{camelCase name}}Repository: widget.repository);
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