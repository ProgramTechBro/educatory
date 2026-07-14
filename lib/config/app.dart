import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'app_constants.dart';
import '../routes/app_pages.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: AppTheme.light,
      routerConfig: AppPages.router,
    );
  }
}
