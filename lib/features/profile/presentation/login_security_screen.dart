import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../routes/app_routes.dart';
import 'local_widgets/profile_menu_item.dart';
import 'local_widgets/profile_menu_section.dart';

class LoginSecurityScreen extends StatelessWidget {
  const LoginSecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
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
          'Login & Security',
          style: AppTypography.bodyLargeRegular.copyWith(
            color: AppColors.neutral900,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ProfileMenuSection(
          items: [
            ProfileMenuItem(
              icon: Icons.person_outline,
              label: 'Change Password',
              onTap: () => context.push(AppRoutes.changePassword),
            ),
            ProfileMenuItem(
              icon: Icons.shield_outlined,
              label: '2-Step Verification',
              onTap: () => context.push(AppRoutes.twoStepVerification),
            ),
          ],
        ),
      ),
    );
  }
}
