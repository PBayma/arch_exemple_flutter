// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';

import '../../domain/usecases/get_cep_search_usecase.dart';
import '../view_model/cep_search_state.dart';
import '../view_model/cep_search_view_model.dart';

class CepSearchView extends StatefulWidget {
  final GetCepSearchUseCase usecase;

  const CepSearchView({
    super.key,
    required this.usecase,
  });

  @override
  State<CepSearchView> createState() => _CepSearchViewState();
}

class _CepSearchViewState extends State<CepSearchView> {
  late CepSearchViewModel viewModel;

  @override
  void initState() {
    viewModel = CepSearchViewModel(usecase: widget.usecase);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) => switch (viewModel.state) {
        CepSearchStateLoaded loaded => LoadedBody(
            state: loaded,
            viewModel: viewModel,
          ),
      },
    );
  }
}

class LoadedBody extends StatefulWidget {
  final CepSearchStateLoaded state;
  final CepSearchViewModel viewModel;

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

  Timer? _debounce;

  void _onSearchChanged(String query) {
    widget.viewModel.startWriting();
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(Duration(seconds: 3), () {
      (query);
      widget.viewModel.fetchData(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Flexible(
                child: TextField(
                  controller: _controller,
                  onChanged: _onSearchChanged,
                  decoration: InputDecoration(
                    labelText: "Digite seu CEP",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              if (widget.state.isWriting)
                const SizedBox(height: 40, child: CircularProgressIndicator()),
              if (!widget.state.isWriting && widget.state.isValidCep == true)
                Icon(Icons.check_circle, color: Colors.green),
            ],
          ),
          const SizedBox(height: 8),
          if (widget.state.isValidCep == false)
            Text(
              'Cep inválido',
              style: TextStyle(
                color: widget.state.isValidCep ?? false
                    ? Colors.green
                    : Colors.red,
                fontSize: 14,
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }
}
