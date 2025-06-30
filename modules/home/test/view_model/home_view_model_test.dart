import 'package:flutter_test/flutter_test.dart';
import 'package:home/data/models/cep.dart';
import 'package:home/domain/usecases/get_home_usecase.dart';
import 'package:home/view_model/home_state.dart';
import 'package:home/view_model/home_view_model.dart';
import 'package:test_foundation/test_foundation.dart';

import '../fixtures/mock_repositories.dart';

void main() {
  late HomeRepositoryMock mockHomeRepository;
  late GetHomeUsecase getHomeUsecase;
  late HomeViewModel homeViewModel;

  setUp(() {
    mockHomeRepository = HomeRepositoryMock();
    getHomeUsecase = GetHomeUsecase(homeRepository: mockHomeRepository);
    homeViewModel = HomeViewModel(usecase: getHomeUsecase);
  });

  test('initial state', () {
    expect(homeViewModel.state, isA<HomeStateLoading>());
  });

  test('loaded state', () async {
    when(() => mockHomeRepository.fetchData())
        .thenAnswer((_) async => Cep(localidade: 'Goiania'));

    final request = homeViewModel.fetchData();

    expect(homeViewModel.state, isA<HomeStateLoading>());
    await request;
    expect(homeViewModel.state, isA<HomeStateLoaded>());
    expect((homeViewModel.state as HomeStateLoaded).title, 'Goiania');
  });
}
