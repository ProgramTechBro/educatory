import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'app_constants.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: AppTheme.light,
      home: const Scaffold(),
    );
  }
}
