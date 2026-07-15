import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../routes/app_routes.dart';
import 'local_widgets/profile_header_card.dart';
import 'local_widgets/profile_menu_item.dart';
import 'local_widgets/profile_menu_section.dart';
import 'local_widgets/profile_university_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: Stack(
        children: [
          Container(
            height: 220,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF7421CF), Color(0xFFB983FD)],
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 24, 0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => context.pop(),
                        icon: const Icon(
                          Icons.chevron_left,
                          size: 24,
                          color: AppColors.white,
                        ),
                      ),
                      Text(
                        'Profile',
                        style: AppTypography.bodyLargeRegular.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfileHeaderCard(onChangePhotoTap: () {}),
                        const SizedBox(height: 8),
                        const ProfileUniversityCard(),
                        const SizedBox(height: 8),
                        ProfileMenuSection(
                          items: [
                            ProfileMenuItem(
                              icon: Icons.person_outline,
                              label: 'Personal Information',
                              onTap: () {},
                            ),
                            ProfileMenuItem(
                              icon: Icons.credit_card_outlined,
                              label: 'Payment',
                              onTap: () {},
                            ),
                            ProfileMenuItem(
                              icon: Icons.headset_mic_outlined,
                              label: 'Support',
                              onTap: () {},
                            ),
                            ProfileMenuItem(
                              icon: Icons.shield_outlined,
                              label: 'Login & Security',
                              onTap: () {},
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        ProfileMenuSection(
                          items: [
                            ProfileMenuItem(
                              icon: Icons.description_outlined,
                              label: 'Terms & Conditions',
                              onTap: () {},
                            ),
                            ProfileMenuItem(
                              icon: Icons.description_outlined,
                              label: 'Privacy Policy',
                              onTap: () {},
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        ProfileMenuSection(
                          items: [
                            ProfileMenuItem(
                              icon: Icons.person_remove_outlined,
                              label: 'Delete Account',
                              onTap: () {},
                              showChevron: false,
                            ),
                            ProfileMenuItem(
                              icon: Icons.logout,
                              label: 'Logout',
                              onTap: () => context.go(AppRoutes.loginPhone),
                              showChevron: false,
                            ),
                          ],
                        ),
                      ],
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
