import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../core/shared_widgets/app_button.dart';
import '../../../routes/app_routes.dart';
import '../domain/entities/otp_purpose.dart';
import 'local_widgets/auth_back_button.dart';
import 'local_widgets/auth_header.dart';
import 'local_widgets/phone_number_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  String _phoneNumber = '';

  void _getInstructions() {
    context.push(
      AppRoutes.resetPasswordOtp,
      extra: {
        'purpose': OtpPurpose.resetPassword,
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
              const AuthHeader(
                title: 'Reset Password',
                subtitle: 'Please enter the phone number associated with '
                    'your account, and we will send you instructions to '
                    'reset your password.',
              ),
              const SizedBox(height: 40),
              PhoneNumberField(
                onChanged: (value) => _phoneNumber = value,
              ),
              const SizedBox(height: 20),
              AppButton(label: 'Get Instructions', onPressed: _getInstructions),
            ],
          ),
        ),
      ),
    );
  }
}
