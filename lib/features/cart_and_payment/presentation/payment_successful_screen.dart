import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/shared_widgets/app_button.dart';
import '../../../core/shared_widgets/two_button_bottom_bar.dart';
import '../../../routes/app_routes.dart';
import '../../chat/data/datasources/local/chat_local_datasource.dart';

class PaymentSuccessfulScreen extends StatefulWidget {
  final bool isSession;

  const PaymentSuccessfulScreen({super.key, this.isSession = false});

  @override
  State<PaymentSuccessfulScreen> createState() =>
      _PaymentSuccessfulScreenState();
}

class _PaymentSuccessfulScreenState extends State<PaymentSuccessfulScreen> {
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
      bottomNavigationBar: widget.isSession
          ? TwoButtonBottomBar(
              leadingLabel: 'Back to Home',
              onLeadingTap: () => context.go(AppRoutes.home),
              trailingLabel: 'Message Robert',
              onTrailingTap: () {
                final robert = ChatLocalDataSource()
                    .getContacts()
                    .firstWhere((contact) => contact.id == 'robert-fox');
                context.go(AppRoutes.home);
                context.push(AppRoutes.chat, extra: robert);
              },
            )
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
                child: AppButton(
                  label: 'Go to My Courses',
                  onPressed: () => context.goToMyCourses(),
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
                Text('Payment Successful', style: AppTypography.h3Bold),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Text(
                    widget.isSession
                        ? 'Congratulations! Your booking to Robert Fox has been successful.'
                        : 'Your payment has been completed successfully. You can now start learning your new course',
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
