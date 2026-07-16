import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../core/blocs/auth/auth_bloc.dart';
import '../../../core/blocs/auth/auth_event.dart';
import '../../../core/shared_widgets/app_button.dart';
import '../../../routes/app_routes.dart';
import '../domain/entities/otp_purpose.dart';
import '../../../core/shared_widgets/auth_back_button.dart';
import '../../../core/shared_widgets/otp_input_row.dart';
import '../../../core/shared_widgets/resend_code_text.dart';

class OtpVerificationScreen extends StatefulWidget {
  final OtpPurpose purpose;
  final String phone;

  const OtpVerificationScreen({
    super.key,
    required this.purpose,
    required this.phone,
  });

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  void _continue() {
    switch (widget.purpose) {
      case OtpPurpose.register:
        context.push(AppRoutes.registerNameEmail);
        break;
      case OtpPurpose.login:
        context.read<AuthBloc>().add(const AuthOnboardingCompleted());
        context.go(AppRoutes.home);
        break;
      case OtpPurpose.resetPassword:
        context.push(AppRoutes.resetPasswordNew);
        break;
    }
  }

  String get _buttonLabel =>
      widget.purpose == OtpPurpose.resetPassword ? 'Submit' : 'Continue';

  String get _subtitlePrefix => widget.purpose == OtpPurpose.resetPassword
      ? 'Enter the 6 digit code we sent to your Phone number '
      : 'Enter the verification code sent to ';

  String get _subtitleSuffix =>
      widget.purpose == OtpPurpose.resetPassword ? ' in order to reset password' : '';

  String get _displayPhone => widget.phone.isEmpty ? '+1 555-0113' : widget.phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AuthBackButton(),
              const SizedBox(height: 24),
              Text('Enter verification code', style: AppTypography.h3SemiBold),
              const SizedBox(height: 12),
              RichText(
                text: TextSpan(
                  style: AppTypography.bodyLargeRegular.copyWith(
                    color: AppColors.neutral600,
                  ),
                  children: [
                    TextSpan(text: _subtitlePrefix),
                    TextSpan(
                      text: _displayPhone,
                      style: AppTypography.bodyLargeMedium.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    TextSpan(text: _subtitleSuffix),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              OtpInputRow(onCompleted: (_) {}),
              const SizedBox(height: 20),
              AppButton(label: _buttonLabel, onPressed: _continue),
              const SizedBox(height: 20),
              const Center(child: ResendCodeText()),
            ],
          ),
        ),
      ),
    );
  }
}
