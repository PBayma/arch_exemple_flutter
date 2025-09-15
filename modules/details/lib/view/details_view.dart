// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import '../domain/usecases/get_details_usecase.dart';
import 'package:flutter/material.dart';

import '../view_model/details_state.dart';
import '../view_model/details_view_model.dart';

class DetailsView extends StatefulWidget {
  final GetDetailsUsecase useCase;
  final String cityName;

  const DetailsView({
    super.key,
    required this.useCase,
    required this.cityName,
  });

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  late DetailsViewModel viewModel;

  @override
  void initState() {
    viewModel = DetailsViewModel(usecase: widget.useCase);
    viewModel.startScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) => switch (viewModel.state) {
        DetailsStateLoading _ => Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text('Loadings'),
            ),
          ),
        DetailsStateLoaded loaded => Scaffold(
            appBar: AppBar(),
            body: LoadedBody(
              state: loaded,
              cityName: widget.cityName,
              viewModel: viewModel,
            ),
          ),
        DetailsStateError error => Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text(error.message),
            ),
          ),
      },
    );
  }
}

class LoadedBody extends StatefulWidget {
  final DetailsStateLoaded state;
  final String cityName;
  final DetailsViewModel viewModel;

  const LoadedBody({
    super.key,
    required this.state,
    required this.cityName,
    required this.viewModel,
  });

  @override
  State<LoadedBody> createState() => _LoadedBodyState();
}

class _LoadedBodyState extends State<LoadedBody> {
  final TextEditingController _controller = TextEditingController();

  Timer? _debounce;

  void _onSearchChanged(String query) {
    widget.viewModel.startWriting();
    // Cancela o timer anterior
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    // Espera 1 segundo após o último input para executar
    _debounce = Timer(Duration(seconds: 3), () {
      (query);
      widget.viewModel.fetchData(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Column(
            children: [
              Text('Digite seu cep:'),
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      controller: _controller,
                      onChanged: _onSearchChanged,
                    ),
                  ),
                  if (widget.state.isWriting) CircularProgressIndicator(),
                  if (!widget.state.isWriting &&
                      widget.state.hasValidCep == true)
                    Checkbox(value: true, onChanged: (context) {}),
                ],
              ),
            ],
          ),
        ),
        Center(
          child: Text(widget.cityName),
        ),
        Center(
          child: Text(widget.state.details.ddd),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }
}
