import 'package:flutter_test/flutter_test.dart';
import 'package:home/view_model/home_state.dart';

void main() {
  test('load state', () {
    const exepctedComputedTitle = 'Brasilia Capital';

    final state = HomeStateLoaded(title: 'Brasilia');

    expect(state.getTitle, exepctedComputedTitle);
  });
}
