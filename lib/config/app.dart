import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme/app_theme.dart';
import 'app_constants.dart';
import '../core/blocs/auth/auth_bloc.dart';
import '../core/services/local_storage_service.dart';
import '../routes/app_pages.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
        localStorageService: LocalStorageService(),
      ),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appName,
        theme: AppTheme.light,
        routerConfig: AppPages.router,
      ),
    );
  }
}
