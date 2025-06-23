import 'package:flutter/material.dart';

import 'view/details_view.dart';
import 'view_model/details_view_model.dart';
import 'domain/details_repository_interface.dart';

class DetailsModule extends StatelessWidget {
  final IDetailsRepository repository;

  const DetailsModule(
    this.repository, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DetailsView(
      viewModel: DetailsViewModel(detailsRepository: repository),
    );
  }
}
