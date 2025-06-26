import 'package:flutter/material.dart';
import 'package:foundation/app_router.dart';

import 'core/dependency_injection/injections.dart';
import 'core/routes.dart';

void main() {
  Injections.setUp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: routes,
      initialRoute: AppRouter.home,
      onGenerateRoute: (settings) => onGenerateRoute(settings),
    );
  }
}
