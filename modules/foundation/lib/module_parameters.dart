import 'package:flutter/widgets.dart';

class EmptyModuleParameters {
  const EmptyModuleParameters();
}

abstract class BaseModule<TypeParams> extends StatelessWidget {
  const BaseModule({super.key});

  TypeParams getParams(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;

    if (TypeParams is EmptyModuleParameters) {
      return const EmptyModuleParameters() as TypeParams;
    } else if (args is TypeParams) {
      return args;
    } else {
      throw Exception('Invalid parameters type: ${TypeParams.runtimeType}');
    }
  }
}
