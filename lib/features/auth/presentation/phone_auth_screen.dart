import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../core/shared_widgets/app_button.dart';
import '../../../routes/app_routes.dart';
import '../domain/entities/auth_mode.dart';
import '../domain/entities/otp_purpose.dart';
import '../../../core/shared_widgets/auth_back_button.dart';
import 'local_widgets/auth_header.dart';
import '../../../core/shared_widgets/phone_number_field.dart';
import 'local_widgets/social_login_button.dart';

class PhoneAuthScreen extends StatefulWidget {
  final AuthMode mode;

  const PhoneAuthScreen({super.key, required this.mode});

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  String _phoneNumber = '';

  bool get _isLogin => widget.mode == AuthMode.login;

  void _continue() {
    final otpRoute = _isLogin ? AppRoutes.loginOtp : AppRoutes.registerOtp;
    context.push(
      otpRoute,
      extra: {
        'purpose': _isLogin ? OtpPurpose.login : OtpPurpose.register,
        'phone': _phoneNumber,
      },
    );
  }

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
              AuthHeader(
                title: _isLogin ? 'Login with OTP' : 'Enter your number',
                subtitle: 'Enter your phone number to receive verification code.',
              ),
              const SizedBox(height: 40),
              PhoneNumberField(
                onChanged: (value) => _phoneNumber = value,
              ),
              const SizedBox(height: 20),
              AppButton(label: 'Continue', onPressed: _continue),
              if (_isLogin) ...[
                const SizedBox(height: 12),
                AppButton(
                  label: 'Login with Email',
                  variant: AppButtonVariant.secondary,
                  onPressed: () {},
                ),
                const SizedBox(height: 16),
                Center(
                  child: GestureDetector(
                    onTap: () => context.push(AppRoutes.resetPassword),
                    child: Text(
                      'Forgot password?',
                      style: AppTypography.bodyLargeMedium.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 32),
              Center(
                child: GestureDetector(
                  onTap: () => _isLogin
                      ? context.push(AppRoutes.roleSelection)
                      : context.push(AppRoutes.loginPhone),
                  child: RichText(
                    text: TextSpan(
                      style: AppTypography.bodyLargeRegular.copyWith(
                        color: AppColors.neutral500,
                      ),
                      children: [
                        TextSpan(
                          text: _isLogin
                              ? "Don't have an account? "
                              : 'Already have an account? ',
                        ),
                        TextSpan(
                          text: _isLogin ? 'Register' : 'Login',
                          style: AppTypography.bodyLargeMedium.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  const Expanded(child: Divider(color: AppColors.neutral300)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'OR',
                      style: AppTypography.bodySmallRegular,
                    ),
                  ),
                  const Expanded(child: Divider(color: AppColors.neutral300)),
                ],
              ),
              const SizedBox(height: 32),
              SocialLoginButton(
                iconAsset: AppIcons.google,
                label: 'Continue with Google',
                onPressed: () {},
              ),
              const SizedBox(height: 12),
              SocialLoginButton(
                iconAsset: AppIcons.facebook,
                label: 'Continue with Facebook',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
