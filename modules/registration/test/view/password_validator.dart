// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:registration/password_validator/password_validator_module.dart';
// import 'package:test_foundation/test_foundation.dart';

// import '../fixtures/mock_repositories.dart';

// void main() {
//   late CepSearchRepositoryMock repositoryMock;
//   late PasswordValidatorModule usecase;
//   String validateOnTapWithArguments = '';
//   bool validateOnTap = false;
//   bool validateOnTapSearchCep = false;

//   setUp(() {
//     repositoryMock = HomeRepositoryMock();
//     usecase = GetHomeUsecase(homeRepository: repositoryMock);

//     when(() => repositoryMock.fetchData())
//         .thenAnswer((_) async => Future.value(Cep(localidade: 'Brasilia')));
//   });

//   testWidgets('home widget with two buttons', (tester) async {
//     // Arrange
//     await tester.pumpWidget(MaterialApp(
//       home: HomeView(
//         usecase: usecase,
//         onTapWithArguments: (context, text) {
//           validateOnTapWithArguments = text;
//         },
//         onTap: (context) {
//           validateOnTap = true;
//         },
//         onTapSearchCep: (context) {
//           validateOnTapSearchCep = true;
//         },
//       ),
//     ));

//     expect(find.text('Loadings'), findsOneWidget);

//     await tester.pumpAndSettle();

//     // Act
//     final textFinder = find.text('Brasilia');
//     final buttonWithCity = find.byKey(const Key('fullAddressButton'));
//     final buttonWithoutCity = find.byKey(const Key('halfAddressButton'));

//     // Assert
//     expect(textFinder, findsOneWidget);
//     expect(buttonWithCity, findsOneWidget);
//     expect(buttonWithoutCity, findsOneWidget);

//     await tester.tap(buttonWithCity);
//     await tester.tap(buttonWithoutCity);

//     expect(validateOnTap, isTrue);
//     expect(validateOnTapWithArguments, 'Brasilia');
//   });
// }
