sealed class {{pascalCase name}}State {}

class {{pascalCase name}}StateLoading extends {{pascalCase name}}State {}

class {{pascalCase name}}StateLoaded extends {{pascalCase name}}State {
  final Object? args;

  {{pascalCase name}}StateLoaded({required this.args});
}
