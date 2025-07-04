// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../domain/details_repository_interface.dart';
import '../view_model/details_state.dart';
import '../view_model/details_view_model.dart';

class DetailsView extends StatefulWidget {
  final IDetailsRepository repository;
  final String cityName;

  const DetailsView({
    super.key,
    required this.repository,
    required this.cityName,
  });

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  late DetailsViewModel viewModel;

  @override
  void initState() {
    viewModel = DetailsViewModel(detailsRepository: widget.repository);
    viewModel.fetchData();

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
            body: LoadedBody(state: loaded, cityName: widget.cityName),
          )
      },
    );
  }
}

class LoadedBody extends StatelessWidget {
  final DetailsStateLoaded state;
  final String cityName;

  const LoadedBody({
    super.key,
    required this.state,
    required this.cityName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(cityName),
        ),
        Center(
          child: Text(state.details.ddd),
        ),
      ],
    );
  }
}
