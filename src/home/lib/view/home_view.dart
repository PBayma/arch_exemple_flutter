import 'package:flutter/material.dart';
import 'package:foundation/app_router.dart';

import '../domain/usecases/get_home_usecase.dart';
import '../view_model/home_state.dart';
import '../view_model/home_view_model.dart';

class HomeView extends StatefulWidget {
  final GetHomeUsecase usecase;

  const HomeView({
    super.key,
    required this.usecase,
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
            body: LoadedBody(state: loaded),
          )
      },
    );
  }
}

class LoadedBody extends StatelessWidget {
  final HomeStateLoaded state;
  const LoadedBody({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(state.title),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(
              context,
              AppRouter.details,
              arguments: state.title,
            ),
            child: Text('Detalhes do endereço'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(
              context,
              AppRouter.details,
            ),
            child: Text('Detalhes do endereço sem cidade'),
          ),
        ],
      ),
    );
  }
}
