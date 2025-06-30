sealed class HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateLoaded extends HomeState {
  final String title;

  String get getTitle => '$title Capital';

  HomeStateLoaded({required this.title});
}
