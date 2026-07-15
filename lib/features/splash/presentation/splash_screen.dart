import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../core/blocs/auth/auth_bloc.dart';
import '../../../core/blocs/auth/auth_event.dart';
import '../../../core/blocs/auth/auth_state.dart';
import '../../../routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateNext();
  }

  Future<void> _navigateNext() async {
    final authBloc = context.read<AuthBloc>();
    authBloc.add(const AuthStarted());
    final results = await Future.wait([
      Future.delayed(const Duration(seconds: 3)),
      authBloc.stream.firstWhere(
        (state) => state.status != AuthStatus.unknown,
      ),
    ]);
    if (!mounted) return;
    final authState = results[1] as AuthState;
    context.go(
      authState.status == AuthStatus.returningUser
          ? AppRoutes.home
          : AppRoutes.onboarding,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.gradientSplashBackground,
          ),
        ),
        child: SizedBox.expand(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppImages.splashLogo,
                  width: 120,
                  height: 120,
                ),
                const SizedBox(height: 24),
                Text(
                  'educatory',
                  style: AppTypography.logoWordmark,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
