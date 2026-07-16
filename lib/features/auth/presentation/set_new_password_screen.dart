import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../core/shared_widgets/app_button.dart';
import '../../../routes/app_routes.dart';
import '../../../core/shared_widgets/auth_back_button.dart';
import 'local_widgets/auth_header.dart';
import '../../../core/shared_widgets/password_field.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
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
              const AuthHeader(title: 'Set new password'),
              const SizedBox(height: 40),
              PasswordField(
                label: 'New Password',
                hint: '••••••••',
                controller: _passwordController,
              ),
              const SizedBox(height: 12),
              PasswordField(
                label: 'Confirm Password',
                hint: 'Re-enter new password',
                controller: _confirmPasswordController,
              ),
              const SizedBox(height: 20),
              AppButton(
                label: 'Reset Password',
                onPressed: () => context.go(AppRoutes.loginPhone),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
