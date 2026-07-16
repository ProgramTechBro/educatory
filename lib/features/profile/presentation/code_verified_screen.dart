import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../core/shared_widgets/app_button.dart';
import '../../../routes/app_routes.dart';

class CodeVerifiedScreen extends StatefulWidget {
  const CodeVerifiedScreen({super.key});

  @override
  State<CodeVerifiedScreen> createState() => _CodeVerifiedScreenState();
}

class _CodeVerifiedScreenState extends State<CodeVerifiedScreen> {
  late final ConfettiController _confettiController = ConfettiController(
    duration: const Duration(seconds: 2),
  );

  @override
  void initState() {
    super.initState();
    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
          child: AppButton(
            label: 'Go to Home',
            onPressed: () => context.go(AppRoutes.home),
          ),
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              numberOfParticles: 24,
              maxBlastForce: 20,
              minBlastForce: 8,
              gravity: 0.3,
              colors: const [Colors.blue, Colors.red, Colors.green],
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: AppColors.green50,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_circle,
                    size: 64,
                    color: AppColors.green600,
                  ),
                ),
                const SizedBox(height: 48),
                Text('2-Step Verification Added', style: AppTypography.h3Bold),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Text(
                    'Your account now has one additional step of security '
                    'added.',
                    textAlign: TextAlign.center,
                    style: AppTypography.bodyLargeRegular.copyWith(
                      color: AppColors.neutral600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
