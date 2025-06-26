class ModuleParameters<T> {
  final T args;

  const ModuleParameters({required this.args});
}

class EmptyModuleParameters extends ModuleParameters {
  const EmptyModuleParameters({super.args});
}
