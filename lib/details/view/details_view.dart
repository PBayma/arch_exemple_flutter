import 'package:flutter/material.dart';

import '../domain/details_repository_interface.dart';
import '../view_model/details_state.dart';
import '../view_model/details_view_model.dart';

class DetailsView extends StatefulWidget {
  final IDetailsRepository repository;

  const DetailsView({
    super.key,
    required this.repository,
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
            body: LoadedBody(state: loaded),
          )
      },
    );
  }
}

class LoadedBody extends StatelessWidget {
  final DetailsStateLoaded state;
  const LoadedBody({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(state.details.ddd),
    );
  }
}
