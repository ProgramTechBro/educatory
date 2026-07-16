import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../core/shared_widgets/app_button.dart';
import '../../../core/shared_widgets/otp_input_row.dart';
import '../../../core/shared_widgets/resend_code_text.dart';
import '../../../routes/app_routes.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Enter verification code', style: AppTypography.h3SemiBold),
              const SizedBox(height: 4),
              Text.rich(
                TextSpan(
                  style: AppTypography.bodyLargeRegular.copyWith(
                    color: AppColors.neutral600,
                  ),
                  children: [
                    const TextSpan(
                      text: 'Enter the verification code sent to ',
                    ),
                    TextSpan(
                      text: '(217) 555-0113',
                      style: AppTypography.bodyLargeMedium.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              OtpInputRow(onCompleted: (_) {}),
              const SizedBox(height: 24),
              AppButton(
                label: 'Continue',
                onPressed: () => context.push(AppRoutes.codeVerified),
              ),
              const SizedBox(height: 20),
              const Center(child: ResendCodeText()),
            ],
          ),
        ),
      ),
    );
  }
}
