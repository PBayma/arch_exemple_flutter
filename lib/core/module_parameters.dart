class ModuleParameters<T> {
  final T args;

  ModuleParameters({required this.args});
}

class EmptyModuleParameters extends ModuleParameters {
  EmptyModuleParameters({super.args});
}
