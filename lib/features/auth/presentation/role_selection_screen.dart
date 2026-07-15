import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../core/shared_widgets/app_button.dart';
import '../../../routes/app_routes.dart';
import '../domain/entities/user_role.dart';
import 'local_widgets/role_option_card.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  UserRole? _selectedRole;

  void _continue() {
    if (_selectedRole == null) return;
    context.push(AppRoutes.registerPhone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Spacer(flex: 3),
              Text(
                'Welcome to Educatory!\nHow would you like to join us?',
                textAlign: TextAlign.center,
                style: AppTypography.h3SemiBold,
              ),
              const SizedBox(height: 12),
              Text(
                'Select an option from below',
                textAlign: TextAlign.center,
                style: AppTypography.bodyLargeRegular.copyWith(
                  color: AppColors.neutral600,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: RoleOptionCard(
                      iconAsset: AppIcons.teacherIllustration,
                      label: 'Teacher',
                      isSelected: _selectedRole == UserRole.teacher,
                      onTap: () =>
                          setState(() => _selectedRole = UserRole.teacher),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: RoleOptionCard(
                      iconAsset: AppIcons.studentIllustration,
                      label: 'Student',
                      isSelected: _selectedRole == UserRole.student,
                      onTap: () =>
                          setState(() => _selectedRole = UserRole.student),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              AppButton(
                label: 'Continue',
                onPressed: _selectedRole == null ? null : _continue,
              ),
              const Spacer(flex: 2),
              GestureDetector(
                onTap: () => context.push(AppRoutes.loginPhone),
                child: RichText(
                  text: TextSpan(
                    style: AppTypography.bodyLargeRegular.copyWith(
                      color: AppColors.neutral500,
                    ),
                    children: [
                      const TextSpan(text: 'Already have an account? '),
                      TextSpan(
                        text: 'Login',
                        style: AppTypography.bodyLargeMedium.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
