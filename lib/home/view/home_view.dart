import 'package:arquitetura_app/core/routes.dart';
import 'package:flutter/material.dart';

import 'package:arquitetura_app/home/view_model/home_state.dart';
import 'package:arquitetura_app/home/view_model/home_view_model.dart';

class HomeView extends StatefulWidget {
  final HomeViewModel viewModel;

  const HomeView({
    super.key,
    required this.viewModel,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    widget.viewModel.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) => switch (widget.viewModel.state) {
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
            onPressed: () => Navigator.pushNamed(context, AppRouter.details),
            child: Text('Detalhes do endereço'),
          ),
        ],
      ),
    );
  }
}
