sealed class HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateLoaded extends HomeState {
  final String title;

  HomeStateLoaded({required this.title});
}
