import 'package:flutter/material.dart';
import 'package:foundation/foundation.dart';

import '../domain/usecases/get_home_usecase.dart';
import '../view_model/home_state.dart';
import '../view_model/home_view_model.dart';

class HomeView extends StatefulWidget {
  final GetHomeUsecase usecase;
  final void Function(BuildContext, String) onTapWithArguments;
  final void Function(BuildContext) onTap;
  final void Function(BuildContext) onTapSearchCep;

  const HomeView({
    super.key,
    required this.usecase,
    required this.onTapWithArguments,
    required this.onTap,
    required this.onTapSearchCep,
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
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localization.appTitle),
      ),
      body: ListenableBuilder(
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
                onTapSearchCep: widget.onTapSearchCep,
              ),
            )
        },
      ),
    );
  }
}

class LoadedBody extends StatelessWidget {
  final firstButtonKey = Key('fullAddressButton');
  final secondButtonKey = Key('halfAddressButton');
  final thirdButtonKey = Key('cepSearchButton');

  final HomeStateLoaded state;
  final Function(BuildContext, String) onTapWithArguments;
  final Function(BuildContext) onTap;
  final void Function(BuildContext) onTapSearchCep;

  LoadedBody({
    super.key,
    required this.state,
    required this.onTapWithArguments,
    required this.onTap,
    required this.onTapSearchCep,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(state.title),
          ElevatedButton(
            key: firstButtonKey,
            onPressed: () => onTapWithArguments(context, state.title),
            child: Text('Detalhes do endereço'),
          ),
          ElevatedButton(
            key: secondButtonKey,
            onPressed: () => onTap(context),
            child: Text('Detalhes do endereço sem cidade'),
          ),
          ElevatedButton(
            key: thirdButtonKey,
            onPressed: () => onTapSearchCep(context),
            child: Text('Poc tela de cadastro'),
          ),
        ],
      ),
    );
  }
}
