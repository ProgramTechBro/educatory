import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../core/shared_widgets/app_bottom_sheet.dart';
import '../../../core/shared_widgets/app_button.dart';
import '../../../core/shared_widgets/app_text_field.dart';
import '../../../routes/app_routes.dart';
import 'local_widgets/auth_back_button.dart';
import 'local_widgets/auth_header.dart';
import 'local_widgets/linear_stepper.dart';

const List<String> _majorOptions = [
  'Computer Science Engineering',
  'Electrical Engineering',
  'Business Administration',
  'Mechanical Engineering',
  'Psychology',
];

const List<String> _universityOptions = [
  'University of Philadelphia',
  'University of California',
  'University of Texas',
  'University of Washington',
];

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  final TextEditingController _universityIdController =
      TextEditingController();
  String? _major;
  String? _university;

  @override
  void dispose() {
    _universityIdController.dispose();
    super.dispose();
  }

  Future<void> _pickMajor() async {
    final result = await AppBottomSheet.showOptionPicker(
      context: context,
      title: 'Select Major',
      options: _majorOptions,
    );
    if (result != null) setState(() => _major = result);
  }

  Future<void> _pickUniversity() async {
    final result = await AppBottomSheet.showOptionPicker(
      context: context,
      title: 'Select University',
      options: _universityOptions,
    );
    if (result != null) setState(() => _university = result);
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
              const LinearStepper(stepCount: 3, currentStep: 1),
              const SizedBox(height: 24),
              const AuthHeader(
                title: 'Your education',
                subtitle: 'Provide your educational information',
              ),
              const SizedBox(height: 40),
              AppTextField(
                label: 'University ID',
                hint: '189204 8923',
                controller: _universityIdController,
              ),
              const SizedBox(height: 12),
              AppTextField(
                label: 'Major',
                hint: _major ?? 'Computer Science Engineering',
                readOnly: true,
                onTap: _pickMajor,
                suffixIcon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 20,
                  color: AppColors.neutral500,
                ),
              ),
              const SizedBox(height: 12),
              AppTextField(
                label: 'University',
                hint: _university ?? 'University of Philadelphia',
                readOnly: true,
                onTap: _pickUniversity,
                suffixIcon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 20,
                  color: AppColors.neutral500,
                ),
              ),
              const SizedBox(height: 20),
              AppButton(
                label: 'Continue',
                onPressed: () => context.push(AppRoutes.registerPhoto),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
