import 'package:flutter/material.dart';

import '../domain/usecases/get_home_usecase.dart';
import '../view_model/home_state.dart';
import '../view_model/home_view_model.dart';

class HomeView extends StatefulWidget {
  final GetHomeUsecase usecase;
  final void Function(BuildContext, String) onTapWithArguments;
  final void Function(BuildContext) onTap;

  const HomeView({
    super.key,
    required this.usecase,
    required this.onTapWithArguments,
    required this.onTap,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeViewModel viewModel;

  @override
  void initState() {
    viewModel = HomeViewModel(usecase: widget.usecase);
    viewModel.fetchData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) => switch (viewModel.state) {
        HomeStateLoading _ => Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text('Loadings'),
            ),
          ),
        HomeStateLoaded loaded => Scaffold(
            appBar: AppBar(),
            body: LoadedBody(
              state: loaded,
              onTapWithArguments: widget.onTapWithArguments,
              onTap: widget.onTap,
            ),
          )
      },
    );
  }
}

class LoadedBody extends StatelessWidget {
  final HomeStateLoaded state;
  final Function(BuildContext, String) onTapWithArguments;
  final Function(BuildContext) onTap;

  const LoadedBody({
    super.key,
    required this.state,
    required this.onTapWithArguments,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(state.title),
          ElevatedButton(
            onPressed: () => onTapWithArguments(context, state.title),
            child: Text('Detalhes do endereço'),
          ),
          ElevatedButton(
            onPressed: () => onTap(context),
            child: Text('Detalhes do endereço sem cidade'),
          ),
        ],
      ),
    );
  }
}
