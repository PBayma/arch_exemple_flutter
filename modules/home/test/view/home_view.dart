import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/data/models/cep.dart';
import 'package:home/domain/usecases/get_home_usecase.dart';
import 'package:home/view/home_view.dart';
import 'package:test_foundation/test_foundation.dart';

import '../fixtures/mock_repositories.dart';

void main() {
  late HomeRepositoryMock repositoryMock;
  late GetHomeUsecase usecase;
  String validateOnTapWithArguments = '';
  bool validateOnTap = false;

  setUp(() {
    repositoryMock = HomeRepositoryMock();
    usecase = GetHomeUsecase(homeRepository: repositoryMock);

    when(() => repositoryMock.fetchData())
        .thenAnswer((_) async => Future.value(Cep(localidade: 'Brasilia')));
  });

  testWidgets('home widget with two buttons', (tester) async {
    // Arrange
    await tester.pumpWidget(MaterialApp(
      home: HomeView(
        usecase: usecase,
        onTapWithArguments: (context, text) {
          validateOnTapWithArguments = text;
        },
        onTap: (context) {
          validateOnTap = true;
        },
      ),
    ));

    expect(find.text('Loadings'), findsOneWidget);

    await tester.pumpAndSettle();

    // Act
    final textFinder = find.text('Brasilia');
    final buttonWithCity = find.byKey(const Key('fullAddressButton'));
    final buttonWithoutCity = find.byKey(const Key('halfAddressButton'));

    // Assert
    expect(textFinder, findsOneWidget);
    expect(buttonWithCity, findsOneWidget);
    expect(buttonWithoutCity, findsOneWidget);

    await tester.tap(buttonWithCity);
    await tester.tap(buttonWithoutCity);

    expect(validateOnTap, isTrue);
    expect(validateOnTapWithArguments, 'Brasilia');
  });
}
