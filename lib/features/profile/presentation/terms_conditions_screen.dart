import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  static const Map<String, String> _sections = {
    'Service Agreement':
        'By using Educatory, you agree to abide by the following terms '
        'and conditions outlined herein.',
    'Scope of Services':
        'Educatory provides educational resources and tools to enhance '
        'learning experiences for students and educators. This includes '
        'but is not limited to interactive lessons, quizzes, and progress '
        'tracking.',
    'Service Limitations':
        'Users are required to create an account to access Educatory '
        'services. Accurate and complete information must be provided '
        'during registration. Users are responsible for maintaining the '
        'confidentiality of their account credentials.',
    'Payment':
        'Educatory may require payment. Payment is due at the time of '
        'service subscription. We accept credit/debit cards and '
        'electronic payments. Subscription fees and any additional '
        'charges will be clearly outlined.',
    'Cancellation Policy':
        'Users may cancel their subscription at any time. Cancellations '
        'must be made through the account settings. Refunds will be '
        'provided according to our refund policy outlined on our '
        'website.',
    'Liability':
        'All content provided on Educatory is for personal and '
        'non-commercial use. Users may not distribute, modify, transmit, '
        'reuse, or use the content for public or commercial purposes '
        'without explicit permission.',
    'Client Responsibilities':
        'Users are responsible for ensuring that their use of Educatory '
        'complies with all applicable laws and regulations. Any misuse '
        'of the platform, including but not limited to sharing offensive '
        'or inappropriate content, will result in the termination of the '
        'account.',
    'Warranty':
        'Educatory is committed to protecting user privacy. Personal '
        'information collected during registration and usage of the '
        'service will be handled according to our Privacy Policy, which '
        'can be accessed on our website.',
    'Indemnification':
        'Users agree to indemnify and hold harmless Educatory and its '
        'employees from any claims, damages, or liabilities arising from '
        'their use of the services provided.',
    'Modification of Terms':
        'Educatory reserves the right to modify or update these terms '
        'and conditions at any time. Users will be notified of any '
        'changes prior to their enforcement.',
  };

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
          'Terms & Conditions',
          style: AppTypography.bodyLargeRegular.copyWith(
            color: AppColors.neutral900,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Terms & Conditions', style: AppTypography.h3SemiBold),
            const SizedBox(height: 24),
            for (final entry in _sections.entries) ...[
              Text(entry.key, style: AppTypography.h4SemiBold),
              const SizedBox(height: 8),
              Text(
                entry.value,
                style: AppTypography.bodyLargeRegular.copyWith(
                  color: AppColors.neutral600,
                ),
              ),
              const SizedBox(height: 24),
            ],
          ],
        ),
      ),
    );
  }
}
