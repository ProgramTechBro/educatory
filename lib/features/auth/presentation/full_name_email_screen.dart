import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../core/shared_widgets/app_button.dart';
import '../../../core/shared_widgets/app_text_field.dart';
import '../../../routes/app_routes.dart';
import 'local_widgets/auth_back_button.dart';
import 'local_widgets/auth_header.dart';
import 'local_widgets/linear_stepper.dart';

class FullNameEmailScreen extends StatefulWidget {
  const FullNameEmailScreen({super.key});

  @override
  State<FullNameEmailScreen> createState() => _FullNameEmailScreenState();
}

class _FullNameEmailScreenState extends State<FullNameEmailScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
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
              const SizedBox(height: 16),
              const LinearStepper(stepCount: 3, currentStep: 0),
              const SizedBox(height: 24),
              const AuthHeader(
                title: 'Your details',
                subtitle: "Tell us a bit about yourself to get started.",
              ),
              const SizedBox(height: 40),
              AppTextField(
                label: 'Full Name',
                hint: 'Muhammad Shahin',
                controller: _nameController,
              ),
              const SizedBox(height: 20),
              AppTextField(
                label: 'Email',
                hint: 'shahin98.design@gmail.com',
                controller: _emailController,
                prefixIcon: const Icon(
                  Icons.mail_outline,
                  size: 20,
                  color: AppColors.neutral500,
                ),
              ),
              const SizedBox(height: 20),
              AppButton(
                label: 'Continue',
                onPressed: () => context.push(AppRoutes.registerEducation),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
