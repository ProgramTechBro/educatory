import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  static const Map<String, String> _sections = {
    'Introduction':
        'Educatory ("we," "our," or "us") is committed to protecting '
        'your privacy. This Privacy Policy explains how we collect, use, '
        'and safeguard your information when you use our education app '
        '("App"). By using the App, you agree to this policy.',
    'Information We Collect':
        'Personal Information: Name, Email address, Phone number, '
        'Payment information (for subscription services).',
    'Data Usage':
        'IP address, Browser type and version, Pages visited, Time and '
        'date of visits, Time spent on pages, Unique device identifiers, '
        'Diagnostic data.',
    'Cookies and Tracking Technologies':
        'We use cookies and similar technologies to track activity on '
        'our App. You can set your browser to refuse cookies, but some '
        'App features may not work properly without them.',
    'How We Use Your Information':
        'To provide and maintain our App, to improve and personalize '
        'user experience, to analyze usage patterns, to develop new '
        'features, to manage transactions and subscriptions, to '
        'communicate with users, to send emails, to prevent fraud, to '
        'analyze trends and demographics.',
    'Sharing Your Information':
        'With Service Providers: For tasks such as payment processing, '
        'data analysis, email delivery, hosting, customer service, and '
        'marketing. For Business Transfers: During negotiations or in '
        'the event of a merger, sale, or acquisition. With Affiliates: '
        'We may share information with affiliates who will adhere to '
        'this policy. With Business Partners: To offer certain '
        'products, services, or promotions.',
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
          'Privacy Policy',
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
            Text('Privacy Policy', style: AppTypography.h3SemiBold),
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
