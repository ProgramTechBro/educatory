import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../core/shared_widgets/password_field.dart';
import '../../../core/shared_widgets/two_button_bottom_bar.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController =
      TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.chevron_left,
            size: 24,
            color: AppColors.neutral900,
          ),
        ),
        title: Text(
          'Change Password',
          style: AppTypography.bodyLargeRegular.copyWith(
            color: AppColors.neutral900,
          ),
        ),
      ),
      bottomNavigationBar: TwoButtonBottomBar(
        leadingLabel: 'Cancel',
        onLeadingTap: () => context.pop(),
        trailingLabel: 'Change Password',
        onTrailingTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password changed successfully')),
          );
          context.pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Change Password', style: AppTypography.h3SemiBold),
            const SizedBox(height: 16),
            PasswordField(
              label: 'Current Password',
              hint: '••••••••',
              controller: _currentPasswordController,
            ),
            const SizedBox(height: 16),
            PasswordField(
              label: 'New Password',
              hint: '••••••••',
              controller: _newPasswordController,
            ),
            const SizedBox(height: 16),
            PasswordField(
              label: 'Confirm Password',
              hint: 'Re-enter new password',
              controller: _confirmPasswordController,
            ),
          ],
        ),
      ),
    );
  }
}
